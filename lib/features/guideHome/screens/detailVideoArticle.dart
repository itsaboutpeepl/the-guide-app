import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peepl/features/guideHome/helpers/customControls.dart';
import 'package:peepl/features/shared/widgets/snackbars.dart';
import 'package:video_player/video_player.dart';

class DetailVideoArticle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailVideoArticleState();
  }
}

class _DetailVideoArticleState extends State<DetailVideoArticle> {
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
    return !isPlayBackCompleted
        ? Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              actions: [
                IconButton(
                    onPressed: () => {},
                    icon: Icon(
                      Icons.share,
                      size: 25.0,
                    ))
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Column(
                children: [
                  Text(
                    "City Council release statement following news that Liverpool is to be given £22m of Government funding",
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("Lifestyle"),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.grey[300],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("36 min ago")
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: _chewieController != null &&
                              _chewieController!
                                  .videoPlayerController.value.isInitialized
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
                  ),
                  Expanded(
                    child: Container(),
                    flex: 3,
                  )
                ],
              ),
            ),
          )
        : Center(
            child: Text("Playback Finished"),
          );
  }
}
