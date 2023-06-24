import 'package:guide_liverpool/models/network_tab_state.dart';
import 'package:guide_liverpool/redux/actions/network_tab_actions.dart';
import 'package:redux/redux.dart';

final networkTabReducers = combineReducers<NetworkTabState>([
  TypedReducer<NetworkTabState, ClearCart>(_clearCart),
  TypedReducer<NetworkTabState, UpdateCartTotal>(_updateCartTotal),
  TypedReducer<NetworkTabState, SetTransferringPayment>(_toggleTransfer),
  TypedReducer<NetworkTabState, SetError>(_toggleError),
  TypedReducer<NetworkTabState, SetConfirmed>(_toggleConfirmed),
  TypedReducer<NetworkTabState, UpdateSelectedAmounts>(_updateSelectedAmounts),
  TypedReducer<NetworkTabState, UpdateRestaurantName>(_updateRestaurantName),
  TypedReducer<NetworkTabState, UpdatePaymentIntentID>(_updatePaymentIntentId),
  TypedReducer<NetworkTabState, UpdateRestaurantWalletAddress>(
      _updateRestaurantWalletAddress),
  TypedReducer<NetworkTabState, SetShouldShowPaymentSheet>(
      _setShouldShowPaymentSheet),
  TypedReducer<NetworkTabState, SetLoadingPaymentButton>(
      _setLoadingPaymentButton),
]);

NetworkTabState _clearCart(
  NetworkTabState state,
  ClearCart action,
) {
  return state.copyWith(
    paymentIntentID: "",
    selectedGBPxAmount: 0.0,
    selectedPPLAmount: 0.0,
    transferringTokens: false,
    errorCompletingPayment: false,
    confirmedPayment: false,
  );
}

NetworkTabState _updateCartTotal(
    NetworkTabState state, UpdateCartTotal action) {
  return state.copyWith(cartTotal: action.cartTotal);
}

NetworkTabState _toggleTransfer(
  NetworkTabState state,
  SetTransferringPayment action,
) {
  return state.copyWith(transferringTokens: action.flag);
}

NetworkTabState _toggleError(
  NetworkTabState state,
  SetError action,
) {
  return state.copyWith(errorCompletingPayment: action.flag);
}

NetworkTabState _toggleConfirmed(
  NetworkTabState state,
  SetConfirmed action,
) {
  return state.copyWith(confirmedPayment: action.flag);
}

NetworkTabState _updateSelectedAmounts(
  NetworkTabState state,
  UpdateSelectedAmounts action,
) {
  return state.copyWith(
    selectedGBPxAmount: action.gbpxAmount,
    selectedPPLAmount: action.pplAmount,
  );
}

NetworkTabState _updateRestaurantName(
    NetworkTabState state, UpdateRestaurantName action) {
  return state.copyWith(restaurantName: action.restaurantName);
}

NetworkTabState _updatePaymentIntentId(
    NetworkTabState state, UpdatePaymentIntentID action) {
  return state.copyWith(paymentIntentID: action.paymentIntentID);
}

NetworkTabState _updateRestaurantWalletAddress(
    NetworkTabState state, UpdateRestaurantWalletAddress action) {
  return state.copyWith(
      restaurantWalletAddress: action.restaurantWalletAddress);
}

NetworkTabState _setShouldShowPaymentSheet(
    NetworkTabState state, SetShouldShowPaymentSheet action) {
  return state.copyWith(
    shouldShowPaymentSheet: action.flag,
  );
}

NetworkTabState _setLoadingPaymentButton(
    NetworkTabState state, SetLoadingPaymentButton action) {
  return state.copyWith(
    loadingPaymentButton: action.flag,
  );
}
