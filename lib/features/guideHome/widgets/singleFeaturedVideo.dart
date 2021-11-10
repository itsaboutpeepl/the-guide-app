import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peepl/common/router/routes.gr.dart';
import 'package:peepl/features/guideHome/helpers/customControls.dart';
import 'package:peepl/features/shared/widgets/snackbars.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/src/center_play_button.dart';

class SingleFeaturedVideo extends StatefulWidget {
  const SingleFeaturedVideo({Key? key}) : super(key: key);

  @override
  State<SingleFeaturedVideo> createState() => _SingleFeaturedVideoState();
}

class _SingleFeaturedVideoState extends State<SingleFeaturedVideo> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool isPlayBackCompleted = false;

  @override
  void initState() {
    super.initState();
    initializePlayer();
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
      autoPlay: true,
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
    );

    //Listener that checks for playback completion.
    _videoPlayerController.addListener(
      () {
        if (_videoPlayerController.value.position ==
            _videoPlayerController.value.duration) {
          _chewieController!.exitFullScreen();
          Future.delayed(Duration(seconds: 1),
              () => {showPlayBackCompletedFlushBar(context)});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {_playAndToggle()},
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: _chewieController != null &&
                    _chewieController!.videoPlayerController.value.isInitialized
                ? Chewie(
                    controller: _chewieController!,
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
                  stops: [0.4, 1.0],
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
            top: 10,
            right: 10,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Color.fromRGBO(235, 138, 64, 1),
                    Color.fromRGBO(215, 55, 48, 1),
                  ],
                  stops: [0.4, 1.0],
                ),
              ),
              child: Center(
                child: Text(
                  "50",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
              ),
            ),
          ),
          // Positioned.fill(
          //   child: CenterPlayButton(
          //     backgroundColor: Colors.black54,
          //     iconColor: Colors.white,
          //     isFinished: _videoPlayerController.value.isLooping,
          //     isPlaying: _videoPlayerController.value.isPlaying,
          //     show: false,
          //     onPressed: () => {_playAndToggle()},
          //   ),
          // ),
        ],
      ),
    );
  }

  void _playAndToggle() {
    _chewieController!.toggleFullScreen();
    _chewieController!.isPlaying
        ? _chewieController!.pause()
        : _chewieController!.play();
  }
}
