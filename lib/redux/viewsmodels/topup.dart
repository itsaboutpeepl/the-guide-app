import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:guide_liverpool/models/app_state.dart';

class TopUpViewModel extends Equatable {
  const TopUpViewModel({
    required this.walletAddress,
    required this.topUpAmount,
  });

  factory TopUpViewModel.fromStore(Store<AppState> store) {
    return TopUpViewModel(
      walletAddress: store.state.userState.walletAddress,
      topUpAmount: store.state.cartState.cartTotal == 0
          ? 25
          : store.state.cartState.cartTotal,
    );
  }

  final String walletAddress;
  final int topUpAmount;

  @override
  List<Object> get props => [
        walletAddress,
      ];
}
