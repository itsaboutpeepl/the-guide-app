import 'dart:core';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';

class RecoveryViewModel {
  RecoveryViewModel({
    required this.generateWalletFromBackup,
  });

  factory RecoveryViewModel.fromStore(Store<AppState> store) {
    return RecoveryViewModel(
      generateWalletFromBackup: (
        mnemonic,
        VoidCallback successCallback,
        VoidCallback failureCallback,
      ) {
        store.dispatch(
          restoreWalletCall(
            mnemonic.split(' ').toList(),
            successCallback,
            failureCallback,
          ),
        );
      },
    );
  }

  final void Function(
    String,
    VoidCallback successCallback,
    VoidCallback failureCallback,
  ) generateWalletFromBackup;
}
