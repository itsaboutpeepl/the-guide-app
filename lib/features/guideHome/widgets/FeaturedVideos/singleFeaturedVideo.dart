import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/features/guideHome/helpers/UrlLaunch.dart';
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
    setState(() {});
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
      aspectRatio: 1.46,
    );

    //Listener that checks for playback completion.
    _videoPlayerController.addListener(
      () {
        if (_videoPlayerController.value.position ==
                _videoPlayerController.value.duration &&
            !_isPlayBackCompletedOnce) {
          store.dispatch(UpdatePlayConfetti(playConfetti: true));
          _chewieController!.exitFullScreen();
          _isPlayBackCompletedOnce = true;

          Future.delayed(
            Duration(seconds: 1),
            () => {
              showPlayBackCompletedFlushBar(context),
              //store.dispatch(UpdatePlayConfetti(playConfetti: false))
            },
          );

          if (!_chewieController!.isFullScreen) {
            _videoPlayerController.pause();
          }
        }
      },
    );
  }

  void _playAndToggle() {
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
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Text(
                      widget.videoArticleItem.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 25),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Container(
                  height: 55,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Color.fromRGBO(235, 138, 64, 1),
                        Color.fromRGBO(215, 55, 48, 1),
                      ],
                      stops: [0.4, 0.9],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "50",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 25),
                      ),
                      Text(
                        "PPL",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
