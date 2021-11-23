import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/reducers/home_page_reducer.dart';
import 'package:peepl/redux/reducers/news_reducers.dart';
import 'package:peepl/redux/reducers/pro_mode_reducer.dart';
import 'package:peepl/redux/reducers/swap_reducer.dart';
import 'package:peepl/redux/reducers/user_reducer.dart';
import 'package:peepl/redux/reducers/cash_wallet_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    userState: userReducers(state.userState, action),
    cashWalletState: cashWalletReducers(state.cashWalletState, action),
    proWalletState: proWalletReducers(state.proWalletState, action),
    swapState: swapReducers(state.swapState, action),
    homePageState: HomePageReducers(state.homePageState, action),
    newsState: NewsStateReducers(state.newsState, action),
  );
}
