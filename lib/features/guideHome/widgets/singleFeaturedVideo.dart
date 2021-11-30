import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/guideHome/helpers/customControls.dart';
import 'package:peepl/features/shared/widgets/snackbars.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/actions/home_page_actions.dart';
import 'package:video_player/video_player.dart';
import 'package:redux/redux.dart';

class SingleFeaturedVideo extends StatefulWidget {
  const SingleFeaturedVideo({Key? key}) : super(key: key);

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
    _videoPlayerController = VideoPlayerController.network(
      'https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4',
    );
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
      autoInitialize: true,
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
    return GestureDetector(
      onTap: () => {_playAndToggle()},
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.93,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Chewie(
                        controller: _chewieController!,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Loading'),
                      ],
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
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Text(
                    "City Council release statement following news that Liverpool is to be given £22m of Government funding",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
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
    );
  }
}
