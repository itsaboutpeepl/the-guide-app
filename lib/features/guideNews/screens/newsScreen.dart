import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/guideNews/widgets/categoryArticlesList.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/viewsmodels/newsScreen.dart';

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
      onInit: (store) => {
        _tabController = TabController(
            length: store.state.newsState.categoryNames.length, vsync: this)
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
          controller: _tabController,
          children: [
            //add X number of screens for the tabs
            for (var item in viewmodel.articles) CategoryArticlesList(),
          ],
        ),
      ),
    );
  }
}


// viewmodel.articles
//               .map(
//                 (e) => ListView.separated(
//                   padding: EdgeInsets.symmetric(vertical: 10),
//                   scrollDirection: Axis.vertical,
//                   itemBuilder: (_, index) => CategoryArticle(),
//                   separatorBuilder: (_, index) => Padding(
//                     padding: EdgeInsets.only(bottom: 20),
//                   ),
//                   itemCount: e.articleList.length,
//                 ),
//               )
//               .toList(),