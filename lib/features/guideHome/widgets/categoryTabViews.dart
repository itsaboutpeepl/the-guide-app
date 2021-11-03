import 'package:flutter/material.dart';
import 'package:peepl/features/guideHome/widgets/categoryArticle.dart';

class CategoryTabViews extends StatefulWidget {
  const CategoryTabViews({Key? key, required this.tabController})
      : super(key: key);
  final TabController tabController;

  @override
  _CategoryTabViewsState createState() => _CategoryTabViewsState();
}

class _CategoryTabViewsState extends State<CategoryTabViews> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(15.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.32,
          child: TabBarView(
            controller: widget.tabController,
            children: [
              //ToDo: Change to listviewbuilder
              ListView(
                children: [
                  CategoryArticle(),
                  CategoryArticle(),
                  CategoryArticle(),
                  CategoryArticle(),
                  CategoryArticle(),
                  CategoryArticle(),
                  CategoryArticle(),
                ],
              ),
              ListView(
                children: [
                  CategoryArticle(),
                  CategoryArticle(),
                ],
              ),
              ListView(
                children: [
                  CategoryArticle(),
                  CategoryArticle(),
                ],
              ),
              ListView(
                children: [
                  CategoryArticle(),
                  CategoryArticle(),
                ],
              ),
              ListView(
                children: [
                  CategoryArticle(),
                  CategoryArticle(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
