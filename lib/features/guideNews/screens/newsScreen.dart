import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/constants/theme.dart';
import 'package:guide_liverpool/features/guideNews/widgets/categoryArticlesList.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/category.dart';
import 'package:guide_liverpool/redux/actions/news_actions.dart';
import 'package:guide_liverpool/redux/viewsmodels/newsScreen.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NewsScreenViewModel>(
      distinct: true,
      onInit: (store) {
        _tabController = TabController(
            length: store.state.newsState.categories.length, vsync: this);
        store.dispatch(
          updateCurrentTabList(
            query: store.state.newsState.categories[0].categoryID.toString(),
          ),
        );
        _tabController.addListener(
          () {
            if (_tabController.indexIsChanging) {
              store.dispatch(UpdateNewsIsLoading(isLoading: true));
              store.dispatch(
                  UpdateCurrentTabIndex(currentTabIndex: _tabController.index));

              store.dispatch(
                updateCurrentTabList(
                  query: store.state.newsState.categories[_tabController.index]
                      .categoryID
                      .toString(),
                ),
              );
            }
          },
        );
      },
      converter: NewsScreenViewModel.fromStore,
      builder: (_, viewmodel) => Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: Colors.white,
                tabs: viewmodel.categories
                    .map(
                      (Category category) => Tab(
                        child: Text(category.categoryName),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        body: viewmodel.isLoading
            ? Center(
                child: CircularProgressIndicator(
                    color: flexColorSchemeLight.primary),
              )
            : TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: viewmodel.articles
                    .map((e) => CategoryArticlesList())
                    .toList(),
              ),
      ),
    );
  }
}
