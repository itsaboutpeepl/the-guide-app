import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/cart_actions.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:guide_liverpool/utils/constants.dart';
import 'package:redux/redux.dart';

class PaymentSheetViewModel extends Equatable {
  final String pplBalance;
  final String gbpXBalance;
  final String paymentIntentID;
  final double selectedGBPxAmount;
  final double selectedPPLAmount;
  final bool transferringTokens;
  final bool errorCompletingPayment;
  final bool confirmedPayment;
  final String walletAddress;
  final String restaurantName;
  final int cartTotal;
  final String displayName;
  final String postcode;

  final Function(double GBPxAmount, double PPLAmount) updateSelectedValues;
  final Function(VoidCallback successCallBack, VoidCallback errorCallback)
      sendToken;
  final Function(bool) setTransferringPayment;
  final Function(bool) setError;
  final Function(bool) setConfirmed;
  final Function(
          String, VoidCallback successCallback, VoidCallback errorCallback)
      getOrderDetails;
  final Function(String paymentIntentID) updatePaymentIntentID;
  final Function(String postCode) storePostCode;

  PaymentSheetViewModel({
    required this.pplBalance,
    required this.gbpXBalance,
    required this.paymentIntentID,
    required this.sendToken,
    required this.selectedGBPxAmount,
    required this.selectedPPLAmount,
    required this.updateSelectedValues,
    required this.transferringTokens,
    required this.errorCompletingPayment,
    required this.confirmedPayment,
    required this.setTransferringPayment,
    required this.setError,
    required this.setConfirmed,
    required this.walletAddress,
    required this.restaurantName,
    required this.cartTotal,
    required this.getOrderDetails,
    required this.displayName,
    required this.updatePaymentIntentID,
    required this.storePostCode,
    required this.postcode,
  });

  static PaymentSheetViewModel fromStore(Store<AppState> store) {
    return PaymentSheetViewModel(
        pplBalance: store.state.cashWalletState.tokens[PeeplToken.address]!
            .getBalance(),
        gbpXBalance:
            store.state.cashWalletState.tokens[GBPxToken.address]!.getBalance(),
        paymentIntentID: store.state.cartState.paymentIntentID,
        selectedGBPxAmount: store.state.cartState.selectedGBPxAmount,
        selectedPPLAmount: store.state.cartState.selectedPPLAmount,
        transferringTokens: store.state.cartState.transferringTokens,
        errorCompletingPayment: store.state.cartState.errorCompletingPayment,
        confirmedPayment: store.state.cartState.confirmedPayment,
        walletAddress: store.state.userState.walletAddress,
        cartTotal: store.state.cartState.cartTotal,
        restaurantName: store.state.cartState.restaurantName,
        displayName: store.state.userState.displayName,
        postcode: store.state.userState.postcode,
        updateSelectedValues: (GBPxAmount, PPLAmount) {
          store.dispatch(UpdateSelectedAmounts(GBPxAmount, PPLAmount));
        },
        sendToken: (successCallback, errorCallback) {
          store.dispatch(sendTokenPayment(successCallback, errorCallback));
        },
        setTransferringPayment: (flag) {
          store.dispatch(SetTransferringPayment(flag));
        },
        setError: (flag) {
          store.dispatch(SetError(flag));
        },
        setConfirmed: (flag) {
          store.dispatch(SetConfirmed(flag));
        },
        getOrderDetails:
            (String paymentIntentID, successCallback, errorCallback) {
          store.dispatch(queryOrderDetailsFromPaymentIntentID(
              paymentIntentID, successCallback, errorCallback));
        },
        updatePaymentIntentID: (String paymentIntentID) {
          store.dispatch(UpdatePaymentIntentID(paymentIntentID));
        },
        storePostCode: (postcode) {
          store.dispatch(UpdateUserPostcode(postcode));
        });
  }

  @override
  List<Object> get props => [
        pplBalance,
        gbpXBalance,
        paymentIntentID,
        selectedGBPxAmount,
        selectedPPLAmount,
        transferringTokens,
        errorCompletingPayment,
        confirmedPayment,
      ];
}
