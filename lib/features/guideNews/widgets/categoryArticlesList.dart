import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/features/guideNews/widgets/singleCategoryArticle.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/news_actions.dart';
import 'package:guide_liverpool/redux/viewsmodels/categoryArticleList.dart';

class CategoryArticlesList extends StatefulWidget {
  const CategoryArticlesList({Key? key}) : super(key: key);

  @override
  _CategoryArticlesListState createState() => _CategoryArticlesListState();
}

class _CategoryArticlesListState extends State<CategoryArticlesList> {
  final ScrollController _scrollController = new ScrollController();
  int _page = 2;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CategoryArticleListViewModel>(
      converter: CategoryArticleListViewModel.fromStore,
      onInit: (store) {
        // store.dispatch(updateCurrentTabList(
        //   query: store.state.newsState.categories[0].categoryID.toString(),
        // ));
        _scrollController.addListener(
          () {
            if (_scrollController.position.pixels ==
                _scrollController.position.maxScrollExtent) {
              store.dispatch(updateCurrentTabList(
                  page: _page,
                  query: store
                      .state
                      .newsState
                      .categories[store.state.newsState.currentTabIndex]
                      .categoryID
                      .toString()));
              _page++;
            }
          },
        );
      },
      builder: (_, vm) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          controller: _scrollController,
          itemCount: vm.articles.length,
          itemBuilder: (_, int index) {
            if (vm.articles.length - 1 == index) {
              return Container(
                height: 50,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return SingleCategoryArticle(
              article: vm.articles[index],
            );
          },
          separatorBuilder: (_, index) => Divider(
            indent: MediaQuery.of(context).size.width * 0.3,
            endIndent: MediaQuery.of(context).size.width * 0.3,
            height: 40,
            thickness: 2,
            color: Colors.grey[200],
          ),
        );
      },
    );
  }
}
