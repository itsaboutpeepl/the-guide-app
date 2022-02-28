import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/home_page_actions.dart';
import 'package:redux/redux.dart';

class HomePageViewModel extends Equatable {
  final Function() onRefresh;
  final bool isLoading;
  final bool isError;

  HomePageViewModel({
    required this.onRefresh,
    required this.isError,
    required this.isLoading,
  });

  static HomePageViewModel fromStore(Store<AppState> store) {
    return HomePageViewModel(
      onRefresh: () {
        store.dispatch(UpdateIsLoading(isLoading: true));
        store.dispatch(fetchHomePageData());
      },
      isLoading: store.state.homePageState.isLoading,
      isError: store.state.homePageState.isError,
    );
  }

  @override
  List<Object> get props => [isLoading, isError];
}
