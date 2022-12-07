import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/network_tab_actions.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:guide_liverpool/utils/constants.dart';
import 'package:redux/redux.dart';

class NetworkScreenViewModel extends Equatable {
  const NetworkScreenViewModel({
    required this.walletAddress,
    required this.displayName,
    required this.postCode,
    required this.updatePaymentIntentId,
    required this.getOrderDetails,
    required this.storePostcode,
    required this.selectedGbpxAmount,
    required this.selectedPplAmount,
    required this.currentGbpxBalance,
    required this.currentPplBalance,
    required this.phoneNumber,
    required this.getSelectedPaymentAmounts,
    required this.currentUrl,
    required this.updateCurrentUrl,
    required this.updateUserEmail,
  });

  factory NetworkScreenViewModel.fromStore(Store<AppState> store) {
    return NetworkScreenViewModel(
      walletAddress: store.state.userState.walletAddress,
      displayName: store.state.userState.displayName,
      postCode: store.state.userState.postCode,
      phoneNumber: store.state.userState.phoneNumber,
      currentUrl: store.state.networkTabState.currentUrl,
      selectedGbpxAmount:
          store.state.networkTabState.selectedGBPxAmount.toStringAsFixed(2),
      selectedPplAmount:
          store.state.networkTabState.selectedPPLAmount.toStringAsFixed(2),
      currentGbpxBalance:
          store.state.cashWalletState.tokens[gbpxToken.address]!.getAmount(),
      currentPplBalance:
          store.state.cashWalletState.tokens[pplToken.address]!.getAmount(),
      updatePaymentIntentId: (String paymentIntentId) {
        store.dispatch(UpdatePaymentIntentID(paymentIntentId));
      },
      getOrderDetails: ({
        required BuildContext context,
        required String selectedPaymentMethod,
      }) {
        store.dispatch(queryOrderDetailsFromPaymentIntentID(
          context: context,
          selectedPaymentMethod: selectedPaymentMethod,
        ));
      },
      storePostcode: (String postCode) {
        store.dispatch(UpdateUserPostcode(postCode: postCode));
      },
      getSelectedPaymentAmounts: () {
        return {
          'gbpAmount': store.state.networkTabState.selectedGBPxAmount,
          'pplAmount': store.state.networkTabState.selectedPPLAmount,
        };
      },
      updateCurrentUrl: (String currentUrl) {
        store.dispatch(UpdateCurrentUrl(currentUrl));
      },
      updateUserEmail: (String email) {
        store.dispatch(UpdateUserEmail(email));
      },
    );
  }

  final String walletAddress;
  final String displayName;
  final String postCode;
  final num currentGbpxBalance;
  final num currentPplBalance;
  final String selectedGbpxAmount;
  final String selectedPplAmount;
  final String phoneNumber;
  final String currentUrl;
  final void Function(String paymentIntentId) updatePaymentIntentId;
  final void Function({
    required BuildContext context,
    required String selectedPaymentMethod,
  }) getOrderDetails;
  final void Function(String postCode) storePostcode;
  final Map<String, dynamic> Function() getSelectedPaymentAmounts;
  final void Function(String currentUrl) updateCurrentUrl;
  final void Function(String email) updateUserEmail;

  @override
  List<Object> get props => [
        displayName,
        postCode,
        selectedGbpxAmount,
        selectedPplAmount,
        currentGbpxBalance,
        currentPplBalance,
        currentUrl
      ];
}
