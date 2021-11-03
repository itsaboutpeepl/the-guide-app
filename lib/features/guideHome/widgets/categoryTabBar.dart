import 'package:flutter/material.dart';
import 'package:peepl/features/guideHome/widgets/sliverTabBarHeader.dart';

class CategoryTabBar extends StatefulWidget {
  const CategoryTabBar({Key? key, required this.tabController})
      : super(key: key);
  final TabController tabController;

  @override
  _CategoryTabBarState createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        delegate: SliverTabBarHeader(
      tabBar: TabBar(
        controller: widget.tabController,
        isScrollable: true,
        indicatorColor: Theme.of(context).colorScheme.primaryVariant,
        labelColor: Theme.of(context).colorScheme.primaryVariant,
        unselectedLabelColor: Colors.grey[400],
        labelStyle: TextStyle(
            fontWeight: FontWeight.w900, fontSize: 15, fontFamily: 'Europa'),
        labelPadding: EdgeInsets.symmetric(horizontal: 15),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(
            child: Text("Latest"),
          ),
          Tab(
            child: Text("Food & Drink"),
          ),
          Tab(
            child: Text("Culture"),
          ),
          Tab(
            child: Text("Family"),
          ),
          Tab(
            child: Text("Features"),
          )
        ],
      ),
    ));
  }
}
