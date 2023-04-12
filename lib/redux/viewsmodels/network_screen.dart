import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:guide_liverpool/features/shared/widgets/update_contact_info.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/network_tab_actions.dart';
import 'package:guide_liverpool/utils/constants.dart';
import 'package:redux/redux.dart';

class NetworkScreenViewModel extends Equatable {
  const NetworkScreenViewModel({
    required this.isUserDataValid,
    required this.pplBalance,
    required this.onPayClick,
    required this.email,
  });

  factory NetworkScreenViewModel.fromStore(Store<AppState> store) {
    return NetworkScreenViewModel(
      email: store.state.userState.email,
      onPayClick: (productId, context) async {
        if (store.state.userState.email.isEmpty) {
          await showModalBottomSheet<bool>(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            elevation: 5,
            context: context,
            builder: (context) => const UpdateContactInfoDialog(),
          ).then((value) {
            if (value!) store.dispatch(createOrder(productId, context));
          });
        } else {
          await store.dispatch(createOrder(productId, context));
        }
      },
      isUserDataValid: () {
        if (store.state.userState.email.isEmpty) {
          return false;
        } else {
          return true;
        }
      },
      pplBalance:
          store.state.cashWalletState.tokens[pplToken.address]!.getAmount(),
    );
  }

  final double pplBalance;
  final bool Function() isUserDataValid;
  final void Function(String productId, BuildContext context) onPayClick;
  final String email;

  @override
  List<Object> get props => [
        pplBalance,
      ];
}

      // userData: {
      //   'walletAddress': store.state.userState.walletAddress,
      //   'addressLineOne':
      //       store.state.homePageState.currentProperty!.addressLineOne,
      //   'addressCity':
      //       store.state.homePageState.currentProperty!.addressLineTwo ??
      //           'Liverpool',
      //   'postCode': store.state.homePageState.currentProperty!.postCode,
      //   'email': store.state.userState.email,
      //   'phone': store.state.userState.phoneNumber,
      // },