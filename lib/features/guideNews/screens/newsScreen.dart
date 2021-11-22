import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/guideHome/widgets/categoryArticle.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/viewsmodels/newsScreen.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NewsScreenViewModel>(
      distinct: true,
      onInit: (store) => {},
      converter: NewsScreenViewModel.fromStore,
      builder: (_, viewmodel) => DefaultTabController(
        length: viewmodel.tabNames.length,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  tabs: viewmodel.tabNames
                      .map(
                        (String tabName) => Tab(
                          child: Text(tabName),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: viewmodel.categoryArticles
                .map(
                  (e) => ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) => CategoryArticle(),
                    separatorBuilder: (_, index) => Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    itemCount: e.articleList.length,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
