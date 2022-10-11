import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/constants/theme.dart';
import 'package:guide_liverpool/features/guideHome/dialogs/playBackCompletedNoAcc.dart';
import 'package:guide_liverpool/features/guideHome/helpers/customControls.dart';
import 'package:guide_liverpool/features/guideHome/helpers/youtubeToStream.dart';
import 'package:guide_liverpool/features/shared/widgets/snackbars.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/videoArticle.dart';
import 'package:guide_liverpool/redux/actions/home_page_actions.dart';
import 'package:video_player/video_player.dart';
import 'package:redux/redux.dart';

class SingleFeaturedVideo extends StatefulWidget {
  final VideoArticle videoArticleItem;
  const SingleFeaturedVideo({Key? key, required this.videoArticleItem})
      : super(key: key);

  @override
  State<SingleFeaturedVideo> createState() => _SingleFeaturedVideoState();
}

class _SingleFeaturedVideoState extends State<SingleFeaturedVideo> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isPlayBackCompletedOnce = false;
  late Store store;
  bool _isLoading = true;
  bool _isNoAcc = false;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void didChangeDependencies() {
    store = StoreProvider.of<AppState>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    String streamURL = await extractVideoUrl(widget.videoArticleItem.videoURL);

    _videoPlayerController = VideoPlayerController.network(streamURL);
    await Future.wait([
      _videoPlayerController.initialize(),
    ]);
    _createChewieController();
    setState(() {
      _isLoading = false;
      _isNoAcc = store.state.userState.walletAddress.isEmpty;
    });
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
      autoInitialize: false,
      customControls: CustomControls(),
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft
      ],
      showOptions: false,
      showControlsOnInitialize: false,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      allowPlaybackSpeedChanging: false,
      allowedScreenSleep: false,
    );

    //Listener that checks for playback completion.
    _videoPlayerController.addListener(
      () {
        if (_videoPlayerController.value.position ==
                _videoPlayerController.value.duration &&
            !_isPlayBackCompletedOnce) {
          _chewieController!.exitFullScreen();

          if (_isNoAcc) {
            Future.delayed(
              Duration(seconds: 2),
              () => showDialog(
                  context: context, builder: (_) => PlayBackCompletedNoAcc()),
            );
          } else {
            _isPlayBackCompletedOnce = true;

            Future.delayed(
              Duration(seconds: 1),
              () => {
                store.dispatch(
                  createVideoView(
                    widget.videoArticleItem.postID,
                    (rewardAmount) {
                      showPlayBackCompletedFlushBar(context, rewardAmount);
                      store.dispatch(UpdatePlayConfetti(playConfetti: true));
                    },
                    () => showErrorSnack(context: context),
                  ),
                )
              },
            );
          }
        }
      },
    );
  }

  void _playAndToggle() {
    if (_isLoading) return;
    _chewieController!.isPlaying
        ? _chewieController!.pause()
        : _chewieController!.play();
    _chewieController!.toggleFullScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () => {_playAndToggle()},
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.92,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Positioned(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Chewie(
                        controller: _chewieController!,
                      ),
                    )
                  : SizedBox.shrink(),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image(
                  image: CachedNetworkImageProvider(
                    widget.videoArticleItem.placeholderImageURL,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black,
                      ],
                      stops: [0.4, 0.8],
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Text(
                      widget.videoArticleItem.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              _isLoading
                  ? Positioned.fill(
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          color: flexColorSchemeLight.primary,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              widget.videoArticleItem.rewardAmount != 0 &&
                      !widget.videoArticleItem.isUserWatched
                  ? Positioned(
                      left: 0.0,
                      top: 0.0,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFAE3E6),
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Get rewarded for watching",
                                style: TextStyle(color: Color(0xFFEB4852)),
                              ),
                              Text(
                                "+${widget.videoArticleItem.rewardAmount.toString()} PPL",
                                style: TextStyle(
                                  color: Color(0xFFEB4852),
                                  fontWeight: FontWeight.w900,
                                ),
                              )
                            ],
                          )),
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
