import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/blogArticle.dart';
import 'package:guide_liverpool/models/articles/category.dart';
import 'package:guide_liverpool/redux/actions/news_actions.dart';
import 'package:redux/redux.dart';

class CategoryArticleListViewModel extends Equatable {
  final Category category;
  final List<BlogArticle> articles;
  final void Function() refreshList;

  CategoryArticleListViewModel({
    required this.category,
    required this.articles,
    required this.refreshList,
  });

  static CategoryArticleListViewModel fromStore(Store<AppState> store) {
    int currentTabIndex = store.state.newsState.currentTabIndex;
    return CategoryArticleListViewModel(
        category: store.state.newsState.categories[currentTabIndex],
        articles: store.state.newsState.articles[currentTabIndex].articleList,
        refreshList: () {
          store.dispatch(refreshCurrentTabList(query: "entertainment"));
        });
  }

  @override
  List<Object> get props => [category, articles];
}
