import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/cart_actions.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:redux/redux.dart';

class ShopScreenViewModel extends Equatable {
  const ShopScreenViewModel({
    required this.walletAddress,
    required this.displayName,
    required this.postCode,
    required this.updatePaymentIntentId,
    required this.getOrderDetails,
    required this.storePostcode,
    required this.selectedGbpxAmount,
    required this.selectedPplAmount,
  });

  factory ShopScreenViewModel.fromStore(Store<AppState> store) {
    return ShopScreenViewModel(
      walletAddress: store.state.userState.walletAddress,
      displayName: store.state.userState.displayName,
      postCode: store.state.userState.postCode,
      selectedGbpxAmount:
          store.state.cartState.selectedGBPxAmount.toStringAsFixed(2),
      selectedPplAmount:
          store.state.cartState.selectedPPLAmount.toStringAsFixed(2),
      updatePaymentIntentId: (String paymentIntentId) {
        store.dispatch(UpdatePaymentIntentID(paymentIntentId));
      },
      getOrderDetails: (BuildContext context) {
        store.dispatch(queryOrderDetailsFromPaymentIntentID(context));
      },
      storePostcode: (String postCode) {
        store.dispatch(UpdateUserPostcode(postCode: postCode));
      },
    );
  }

  final String walletAddress;
  final String displayName;
  final String postCode;
  final String selectedGbpxAmount;
  final String selectedPplAmount;
  final void Function(String paymentIntentId) updatePaymentIntentId;
  final void Function(BuildContext context) getOrderDetails;
  final void Function(String postCode) storePostcode;

  @override
  List<Object> get props => [
        displayName,
        postCode,
        selectedGbpxAmount,
        selectedPplAmount,
      ];
}
