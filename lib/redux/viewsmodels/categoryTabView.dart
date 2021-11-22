import 'package:equatable/equatable.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/models/articles/categoryArticles.dart';
import 'package:redux/redux.dart';

class CategoryTabViewsViewModel extends Equatable {
  final List<CategoryArticles> categoryArticles;

  CategoryTabViewsViewModel({required this.categoryArticles});

  static CategoryTabViewsViewModel fromStore(Store<AppState> store) {
    return CategoryTabViewsViewModel(
      categoryArticles: store.state.newsState.categoryArticles,
    );
  }

  @override
  List<Object> get props => [categoryArticles];
}
