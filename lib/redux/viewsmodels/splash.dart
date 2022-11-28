import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';

class SplashViewModel extends Equatable {
  const SplashViewModel({
    required this.privateKey,
    required this.jwtToken,
    required this.isLoggedOut,
    required this.createLocalAccount,
    required this.loginAgain,
  });

  factory SplashViewModel.fromStore(Store<AppState> store) {
    return SplashViewModel(
      privateKey: store.state.userState.privateKey,
      jwtToken: store.state.userState.jwtToken,
      isLoggedOut: store.state.userState.isLoggedOut,
      createLocalAccount: (
        VoidCallback successCallback,
      ) {
        store.dispatch(
          createLocalAccountCall(
            successCallback,
          ),
        );
      },
      loginAgain: () {
        store.dispatch(reLoginCall());
      },
    );
  }

  final String privateKey;
  final String jwtToken;
  final bool isLoggedOut;
  final void Function() loginAgain;

  final void Function(
    void Function() successCallback,
  ) createLocalAccount;

  @override
  List<Object> get props => [
        privateKey,
        jwtToken,
        isLoggedOut,
      ];
}
