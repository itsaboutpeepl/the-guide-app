import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/guideNews/widgets/singleCategoryArticle.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/models/articles/categoryArticles.dart';
import 'package:peepl/redux/actions/news_actions.dart';
import 'package:peepl/redux/viewsmodels/categoryArticleList.dart';
import 'package:peepl/redux/viewsmodels/newsScreen.dart';

class CategoryArticlesList extends StatefulWidget {
  const CategoryArticlesList({Key? key}) : super(key: key);

  @override
  _CategoryArticlesListState createState() => _CategoryArticlesListState();
}

class _CategoryArticlesListState extends State<CategoryArticlesList> {
  final ScrollController _scrollController = new ScrollController();
  late int indexOfCurrentTab;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CategoryArticleListViewModel>(
      distinct: false,
      converter: (store) => CategoryArticleListViewModel.fromStore(store),
      onInit: (store) => {
        _scrollController.addListener(
          () {
            if (_scrollController.position.pixels ==
                _scrollController.position.maxScrollExtent) {
              var store = StoreProvider.of<AppState>(context);
              store.dispatch(updateCurrentTabList());
              print("CALLING NEW LIST");
            }
          },
        ),
      },
      builder: (_, vm) {
        return RefreshIndicator(
          onRefresh: () async {
            // vm.onLoad();
            // await Future.delayed(Duration(seconds: 2));
          },
          child: ListView.separated(
            controller: _scrollController,
            itemCount: vm.articles.length,
            itemBuilder: (_, int index) {
              if (vm.articles.length - 1 == index) {
                return Container(
                  height: 50,
                  child: Center(
                    child: Theme(
                      data:
                          Theme.of(context).copyWith(accentColor: Colors.blue),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
              return SingleCategoryArticle(
                article: vm.articles[index],
              );
            },
            separatorBuilder: (_, index) =>
                Padding(padding: EdgeInsets.only(bottom: 20)),
          ),
        );
      },
    );
  }
}
