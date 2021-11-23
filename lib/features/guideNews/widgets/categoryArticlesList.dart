import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/guideNews/widgets/singleCategoryArticle.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/viewsmodels/newsScreen.dart';

class CategoryArticlesList extends StatefulWidget {
  const CategoryArticlesList({Key? key}) : super(key: key);

  @override
  _CategoryArticlesListState createState() => _CategoryArticlesListState();
}

class _CategoryArticlesListState extends State<CategoryArticlesList> {
  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          // TODO: Add call to make another call to API for pagination (maybe do at 100px before max scroll extent)
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NewsScreenViewModel>(
      distinct: true,
      converter: (store) => NewsScreenViewModel.fromStore(store),
      onInit: (store) => {},
      builder: (_, vm) {
        // global and first loading indicator
        // if (vm.state.loading) {
        //   return Center(
        //     child: Theme(
        //       data: Theme.of(context),
        //       child: CircularProgressIndicator(),
        //     ),
        //   );
        // }

        return RefreshIndicator(
          onRefresh: () async {
            // vm.onLoad();
            // await Future.delayed(Duration(seconds: 2));
          },
          child: ListView.separated(
            controller: _scrollController,
            itemCount: vm.articles.length,
            itemBuilder: (_, int index) => CategoryArticle(),
            separatorBuilder: (_, index) =>
                Padding(padding: EdgeInsets.only(bottom: 20)),
          ),
        );
      },
    );
  }
}
