import 'package:equatable/equatable.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/models/articles/categoryArticles.dart';
import 'package:redux/redux.dart';

class NewsScreenViewModel extends Equatable {
  final List<String> tabNames;
  final List<CategoryArticles> categoryArticles;

  NewsScreenViewModel({
    required this.tabNames,
    required this.categoryArticles,
  });

  static NewsScreenViewModel fromStore(Store<AppState> store) {
    List<String> tabNames = [];

    store.state.newsState.categoryArticles.forEach((element) {
      tabNames.add(element.categoryName);
    });

    return NewsScreenViewModel(
      tabNames: tabNames,
      categoryArticles: store.state.newsState.categoryArticles,
    );
  }

  @override
  List<Object> get props => [tabNames];
}
