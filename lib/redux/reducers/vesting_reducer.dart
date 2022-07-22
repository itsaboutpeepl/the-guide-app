import 'package:guide_liverpool/models/news_state.dart';
import 'package:guide_liverpool/models/vesting_state.dart';
import 'package:guide_liverpool/redux/actions/vesting_actions.dart';
import 'package:redux/redux.dart';

final VestingStateReducers = combineReducers<VestingState>(
  [
    TypedReducer<VestingState, WithdrawableAmount>(_getWithdrawableAmount),
  ],
);

VestingState _getWithdrawableAmount(
  VestingState state,
  WithdrawableAmount action,
) {
  return state.copyWith(amount: action.amount);
}

// VestingState _getCategoryList(
//   NewsState state,
//   UpdateCategoryList action,
// ) {
//   return state.copyWith(articles: action.categoryList);
// }

// NewsState _getCurrentTabList(NewsState state, UpdateCurrentTabList action) {
//   state.articles[action.currentTabIndex].articleList.addAll(action.articleList);

//   return state.copyWith(currentTabIndex: action.currentTabIndex, articles: state.articles);
// }

// NewsState _refreshCurrentTabList(NewsState state, RefreshCurrentTabList action) {
//   state.articles[action.currentTabIndex].articleList.clear();
//   state.articles[action.currentTabIndex].articleList.addAll(action.articleList);
//   return state.copyWith(currentTabIndex: action.currentTabIndex, articles: state.articles);
// }

// NewsState _updateCurrentTabIndex(NewsState state, UpdateCurrentTabIndex action) {
//   return state.copyWith(currentTabIndex: action.currentTabIndex);
// }

// NewsState _updateIsLoading(NewsState state, UpdateNewsIsLoading action) {
//   return state.copyWith(isLoading: action.isLoading);
// }
