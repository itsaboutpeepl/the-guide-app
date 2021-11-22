import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/guideHome/widgets/sliverTabBarHeader.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/viewsmodels/categoryTabBar.dart';
import 'package:peepl/redux/viewsmodels/featuredPostStack.dart';

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
    return StoreConnector<AppState, CategoryTabBarViewModel>(
      distinct: true,
      onInit: (store) => {},
      converter: CategoryTabBarViewModel.fromStore,
      builder: (_, viewmodel) => SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 7),
        sliver: SliverPersistentHeader(
          delegate: SliverTabBarHeader(
            tabBar: TabBar(
              controller: widget.tabController,
              isScrollable: true,
              indicatorColor: Theme.of(context).colorScheme.primaryVariant,
              labelColor: Theme.of(context).colorScheme.primaryVariant,
              unselectedLabelColor: Colors.grey[400],
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  fontFamily: 'Europa'),
              labelPadding: EdgeInsets.symmetric(horizontal: 8),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: viewmodel.tabNames
                  .map(
                    (String tabName) => Tab(
                      child: Text(tabName),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
