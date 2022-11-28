import 'package:guide_liverpool/models/user_cart_state.dart';
import 'package:guide_liverpool/redux/actions/cart_actions.dart';
import 'package:redux/redux.dart';

final CartStateReducers = combineReducers<UserCartState>([
  TypedReducer<UserCartState, ClearCart>(_clearCart),
  TypedReducer<UserCartState, SetTransferringPayment>(_toggleTransfer),
  TypedReducer<UserCartState, SetError>(_toggleError),
  TypedReducer<UserCartState, SetConfirmed>(_toggleConfirmed),
  TypedReducer<UserCartState, UpdateSelectedAmounts>(_updateSelectedAmounts),
  TypedReducer<UserCartState, UpdateCartTotal>(_updateCartTotal),
  TypedReducer<UserCartState, UpdateRestaurantName>(_updateRestaurantName),
  TypedReducer<UserCartState, UpdateRestaurantWalletAddress>(
      _updateRestaurantWalletAddress),
  TypedReducer<UserCartState, UpdatePaymentIntentID>(_updatePaymentIntentID),
]);

UserCartState _clearCart(
  UserCartState state,
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

UserCartState _toggleTransfer(
  UserCartState state,
  SetTransferringPayment action,
) {
  return state.copyWith(transferringTokens: action.flag);
}

UserCartState _toggleError(
  UserCartState state,
  SetError action,
) {
  return state.copyWith(errorCompletingPayment: action.flag);
}

UserCartState _toggleConfirmed(
  UserCartState state,
  SetConfirmed action,
) {
  return state.copyWith(confirmedPayment: action.flag);
}

UserCartState _updateCartTotal(
  UserCartState state,
  UpdateCartTotal action,
) {
  return state.copyWith(cartTotal: action.cartTotal);
}

UserCartState _updateRestaurantName(
  UserCartState state,
  UpdateRestaurantName action,
) {
  return state.copyWith(restaurantName: action.restaurantName);
}

UserCartState _updateRestaurantWalletAddress(
  UserCartState state,
  UpdateRestaurantWalletAddress action,
) {
  return state.copyWith(
      restaurantWalletAddress: action.restaurantWalletAddress);
}

UserCartState _updateSelectedAmounts(
  UserCartState state,
  UpdateSelectedAmounts action,
) {
  return state.copyWith(
      selectedGBPxAmount: action.gbpxAmount,
      selectedPPLAmount: action.pplAmount);
}

UserCartState _updatePaymentIntentID(
  UserCartState state,
  UpdatePaymentIntentID action,
) {
  return state.copyWith(paymentIntentID: action.paymentIntentID);
}
