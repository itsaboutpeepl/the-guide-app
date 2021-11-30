import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/guideHome/widgets/SliverAppBar.dart';
import 'package:peepl/features/guideHome/widgets/confettiWidget.dart';
import 'package:peepl/features/guideHome/widgets/eventsCalendar.dart';
import 'package:peepl/features/guideHome/widgets/featuredBusinesses.dart';
import 'package:peepl/features/guideHome/widgets/featuredPostStack.dart';
import 'package:peepl/features/guideHome/widgets/featuredVideos.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/actions/home_page_actions.dart';
import 'package:peepl/redux/viewsmodels/featuredPostStack.dart';

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
    return StoreConnector<AppState, FeaturedPostStackViewModel>(
      distinct: true,
      converter: FeaturedPostStackViewModel.fromStore,
      onInit: (store) {
        store.dispatch(fetchFeaturedPost());
        store.dispatch(UpdatePlayConfetti(playConfetti: false));
      },
      builder: (_, viewModel) {
        return MyConfettiWidget(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              MySliverAppBar(),
              FeaturedPostStack(
                onCardChanged: () {
                  setState(() {});
                },
              ),
              EventCalendar(),
              FeaturedBusinesses(),
              FeaturedVideos(),
            ],
          ),
        );
      },
    );
  }
}
