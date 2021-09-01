import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/home/widgets/payment_sheet.dart';
import 'package:peepl/features/shared/widgets/primary_button.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/actions/cash_wallet_actions.dart';
import 'package:peepl/redux/viewsmodels/home.dart';
import 'package:peepl/features/home/widgets/tabs.dart';
import 'package:peepl/features/home/widgets/header.dart';
import 'package:peepl/utils/addresses.dart';
import 'package:peepl/features/shared/widgets/my_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, HomeViewModel>(
      distinct: true,
      converter: HomeViewModel.fromStore,
      onInitialBuild: (viewModel) {
        viewModel.onStart();
      },
      onInit: (store) {
        final communities = store.state.cashWalletState.communities;
        if (!communities.containsKey(defaultCommunityAddress.toLowerCase())) {
          store.dispatch(switchCommunityCall(defaultCommunityAddress));
        }
      },
      builder: (_, viewModel) {
        return Scaffold(
          appBar: MyAppBar(
            height: 156,
            backgroundColor: Colors.black,
            child: Header(),
          ),
          body: Stack(
            children: [
              Tabs(),
              Positioned(
                bottom: 34,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10),
                            topRight: const Radius.circular(10.0),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return PaymentSheet();
                        });
                  },
                  child: Text('Peepl.Pay'),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      primary: Colors.purple),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
