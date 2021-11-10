import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/guideHome/widgets/SliverAppBar.dart';
import 'package:peepl/features/guideHome/widgets/categoryTabBar.dart';
import 'package:peepl/features/guideHome/widgets/categoryTabViews.dart';
import 'package:peepl/features/guideHome/widgets/featuredPost.dart';
import 'package:peepl/features/guideHome/widgets/featuredVideos.dart';
import 'package:peepl/features/guideHome/widgets/recommendedArticles.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/actions/news_actions.dart';
import 'package:peepl/redux/viewsmodels/featuredPost.dart';

class GuideHomeScreen extends StatefulWidget {
  const GuideHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GuideHomeScreen> createState() => _GuideHomeScreenState();
}

class _GuideHomeScreenState extends State<GuideHomeScreen>
    with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeaturedPostViewModel>(
      distinct: true,
      converter: FeaturedPostViewModel.fromStore,
      onInit: (store) {
        store.dispatch(fetchFeaturedPost());
      },
      builder: (_, viewModel) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            MySliverAppBar(),
            FeaturedPost(),
            RecommendedArticles(),
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                sliver: CategoryTabBar(tabController: _tabController)),
            CategoryTabViews(tabController: _tabController),
            FeaturedVideos(),
          ],
        );
      },
    );
  }
}
