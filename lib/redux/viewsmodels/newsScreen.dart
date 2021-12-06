import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/category.dart';
import 'package:guide_liverpool/models/articles/categoryArticles.dart';
import 'package:redux/redux.dart';

class NewsScreenViewModel extends Equatable {
  final List<Category> categories;
  final List<CategoryArticles> articles;

  NewsScreenViewModel({
    required this.categories,
    required this.articles,
  });

  static NewsScreenViewModel fromStore(Store<AppState> store) {
    return NewsScreenViewModel(
      categories: store.state.newsState.categories,
      articles: store.state.newsState.articles,
    );
  }

  @override
  List<Object> get props => [categories, articles];
}
