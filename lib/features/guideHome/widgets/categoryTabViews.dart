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
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.32,
          child: TabBarView(
            controller: widget.tabController,
            children: [
              for (var index = 0; index < widget.tabController.length; index++)
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) => CategoryArticle(),
                    separatorBuilder: (_, index) =>
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                    itemCount: 5),
            ],
          ),
        ),
      ),
    );
  }
}
