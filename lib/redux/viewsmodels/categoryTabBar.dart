import 'package:equatable/equatable.dart';
import 'package:peepl/models/app_state.dart';
import 'package:redux/redux.dart';

class CategoryTabBarViewModel extends Equatable {
  final List<String> tabNames;

  CategoryTabBarViewModel({required this.tabNames});

  static CategoryTabBarViewModel fromStore(Store<AppState> store) {
    List<String> tabNames = [];

    store.state.newsState.categoryArticles.forEach((element) {
      tabNames.add(element.categoryName);
    });

    return CategoryTabBarViewModel(
      tabNames: tabNames,
    );
  }

  @override
  List<Object> get props => [tabNames];
}
