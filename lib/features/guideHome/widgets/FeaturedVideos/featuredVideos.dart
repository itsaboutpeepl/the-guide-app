import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/features/guideHome/widgets/FeaturedVideos/singleFeaturedVideo.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/featuredVideos.dart';

class FeaturedVideos extends StatefulWidget {
  const FeaturedVideos({Key? key}) : super(key: key);

  @override
  _FeaturedVideosState createState() => _FeaturedVideosState();
}

class _FeaturedVideosState extends State<FeaturedVideos> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeaturedVideosViewModel>(
      distinct: true,
      converter: FeaturedVideosViewModel.fromStore,
      builder: (_, viewmodel) {
        return viewmodel.featuredVideos.isEmpty
            ? SliverToBoxAdapter(child: SizedBox.shrink())
            : SliverPadding(
                padding: EdgeInsets.all(15),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Watch",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        thickness: 3,
                        endIndent: MediaQuery.of(context).size.width * 0.8,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: PageView.builder(
                            physics: PageScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) => SingleFeaturedVideo(
                                videoArticleItem:
                                    viewmodel.featuredVideos[index]),
                            itemCount: viewmodel.featuredVideos.length),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
