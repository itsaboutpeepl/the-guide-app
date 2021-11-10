import 'package:flutter/material.dart';
import 'package:peepl/features/guideHome/widgets/singleRecommendedArticle.dart';

class RecommendedArticles extends StatefulWidget {
  const RecommendedArticles({Key? key}) : super(key: key);

  @override
  _RecommendedArticlesState createState() => _RecommendedArticlesState();
}

class _RecommendedArticlesState extends State<RecommendedArticles> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(15),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Featured Article",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 3,
              endIndent: MediaQuery.of(context).size.width * 0.8,
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.38,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => SingleRecommendedArticle(),
                    separatorBuilder: (_, index) =>
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    itemCount: 2))
          ],
        ),
      ),
    );
  }
}
