import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/constants/theme.dart';
import 'package:guide_liverpool/features/guideHome/widgets/AppBar/SliverAppBar.dart';
import 'package:guide_liverpool/features/guideHome/widgets/AppBar/createAccAppBar.dart';
import 'package:guide_liverpool/features/guideHome/widgets/FeaturedPosts/featuredPostStack.dart';
import 'package:guide_liverpool/features/guideHome/widgets/confettiWidget.dart';
import 'package:guide_liverpool/features/guideHome/widgets/EventsCalendar/eventsCalendar.dart';
import 'package:guide_liverpool/features/guideHome/widgets/FeaturedDirectory/featuredDirectory.dart';
import 'package:guide_liverpool/features/guideHome/widgets/FeaturedVideos/featuredVideos.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:guide_liverpool/redux/actions/home_page_actions.dart';
import 'package:guide_liverpool/redux/viewsmodels/homePageViewModel.dart';
import 'package:guide_liverpool/services.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageViewModel>(
      distinct: true,
      converter: HomePageViewModel.fromStore,
      onInit: (store) {
        if (store.state.userState.walletAddress.isEmpty) return;
        store.dispatch(startFetchTokensBalances());
        store.dispatch(UpdatePlayConfetti(playConfetti: false));
      },
      builder: (_, viewModel) {
        return RefreshIndicator(
          onRefresh: () async {
            viewModel.onRefresh();
            return;
          },
          child: MyConfettiWidget(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: viewModel.isLoading
                  ? [
                      MySliverAppBar(),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: flexColorSchemeLight.primary,
                            ),
                          ),
                        ),
                      )
                    ]
                  : [
                      MySliverAppBar(),
                      CreateAccountAppBar(),
                      FeaturedPostStack(),
                      FeaturedVideos(),
                      EventCalendar(),
                      FeaturedDirectory(),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 50),
                      ),
                    ],
            ),
          ),
        );
      },
    );
  }
}
