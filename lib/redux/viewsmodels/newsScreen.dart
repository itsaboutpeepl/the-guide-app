import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/categoryArticles.dart';
import 'package:redux/redux.dart';

class NewsScreenViewModel extends Equatable {
  final List<String> tabNames;
  final List<CategoryArticles> articles;

  NewsScreenViewModel({
    required this.tabNames,
    required this.articles,
  });

  static NewsScreenViewModel fromStore(Store<AppState> store) {
    return NewsScreenViewModel(
      tabNames: store.state.newsState.categoryNames,
      articles: store.state.newsState.articles,
    );
  }

  @override
  List<Object> get props => [tabNames, articles];
}
