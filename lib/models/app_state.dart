import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:guide_liverpool/models/home_page_state.dart';
import 'package:guide_liverpool/models/news_state.dart';
import 'package:guide_liverpool/models/swap_state.dart';
import 'package:guide_liverpool/models/user_cart_state.dart';
import 'package:guide_liverpool/models/user_state.dart';
import 'package:guide_liverpool/models/cash_wallet_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  const AppState._();

  @JsonSerializable()
  factory AppState({
    @UserStateConverter() required UserState userState,
    @CashWalletStateConverter() required CashWalletState cashWalletState,
    @SwapStateConverter() required SwapState swapState,
    @HomePageStateConverter() required HomePageState homePageState,
    @NewsStateConverter() required NewsState newsState,
    @UserCartStateConverter() required UserCartState cartState,
    // @DappStateConverter() required DappState dappState,
  }) = _AppState;

  factory AppState.initial() {
    return AppState(
      userState: UserState.initial(),
      cashWalletState: CashWalletState.initial(),
      swapState: SwapState.initial(),
      homePageState: HomePageState.initial(),
      newsState: NewsState.initial(),
      cartState: UserCartState.initial(),
      // dappState: DappState.initial(),
    );
  }

  factory AppState.fromJson(dynamic json) => _$AppStateFromJson(json);
}
