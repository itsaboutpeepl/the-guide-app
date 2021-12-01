import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/guideNews/screens/newsScreen.dart';
import 'package:peepl/features/guideNews/widgets/singleCategoryArticle.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/actions/news_actions.dart';
import 'package:peepl/redux/viewsmodels/categoryArticleList.dart';

class CategoryArticlesList extends StatefulWidget {
  const CategoryArticlesList({Key? key}) : super(key: key);

  @override
  _CategoryArticlesListState createState() => _CategoryArticlesListState();
}

class _CategoryArticlesListState extends State<CategoryArticlesList> {
  final ScrollController _scrollController = new ScrollController();

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
        store = StoreProvider.of<AppState>(context),
        _scrollController.addListener(
          () {
            if (_scrollController.position.pixels ==
                _scrollController.position.maxScrollExtent) {
              store.dispatch(updateCurrentTabList(query: getRandomQuery()));
            }
          },
        ),
      },
      builder: (_, vm) {
        return RefreshIndicator(
            onRefresh: () async {
              vm.refreshList();
            },
            child: ListView.separated(
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
            ));
      },
    );
  }
}

// return RefreshIndicator(
//           onRefresh: () async {},
//           child: StaggeredGridView.countBuilder(
//             crossAxisCount: 4,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 10,
//             staggeredTileBuilder: (index) =>
//                 StaggeredTile.fit(index.isEven ? 2 : 2),
//             padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//             controller: _scrollController,
//             itemCount: vm.articles.length,
//             itemBuilder: (_, int index) {
//               if (vm.articles.length - 1 == index) {
//                 return Container(
//                   height: 50,
//                   child: Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 );
//               }
//               return TestCard(
//                 article: vm.articles[index],
//               );
//             },
//             // separatorBuilder: (_, index) => Divider(
//             //   indent: MediaQuery.of(context).size.width * 0.3,
//             //   endIndent: MediaQuery.of(context).size.width * 0.3,
//             //   height: 20,
//             //   thickness: 2,
//             //   color: Colors.grey[200],
//             // ),
//           ),
//         );
