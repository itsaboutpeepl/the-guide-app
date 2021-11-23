import 'package:equatable/equatable.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/models/articles/categoryArticles.dart';
import 'package:redux/redux.dart';

class NewsScreenViewModel extends Equatable {
  final List<String> tabNames;
  final List<CategoryArticles> articles;

  NewsScreenViewModel({
    required this.tabNames,
    required this.articles,
  });

  static NewsScreenViewModel fromStore(Store<AppState> store) {
    List<String> tabNames = [];

    store.state.newsState.articles.forEach((element) {
      tabNames.add(element.categoryName);
    });

    return NewsScreenViewModel(
      tabNames: tabNames,
      articles: store.state.newsState.articles,
    );
  }

  @override
  List<Object> get props => [tabNames];
}
