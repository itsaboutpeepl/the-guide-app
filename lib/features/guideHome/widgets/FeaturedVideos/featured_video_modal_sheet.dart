import 'package:flutter/material.dart';
import 'package:guide_liverpool/features/guideHome/widgets/FeaturedVideos/singleFeaturedVideo.dart';
import 'package:guide_liverpool/models/articles/videoArticle.dart';

class FeaturedVideoModalSheet extends StatelessWidget {
  const FeaturedVideoModalSheet({Key? key, required this.video})
      : super(key: key);

  final VideoArticle video;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FractionallySizedBox(
      heightFactor: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              video.title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: size.height * 0.3,
                child: SingleFeaturedVideo(videoArticleItem: video),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
