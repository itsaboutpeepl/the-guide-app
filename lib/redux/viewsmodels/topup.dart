import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';

class TopUpViewModel extends Equatable {
  final String walletAddress;

  TopUpViewModel({required this.walletAddress});

  static TopUpViewModel fromStore(Store<AppState> store) {
    return TopUpViewModel(
      walletAddress: store.state.userState.walletAddress,
    );
  }

  @override
  List<Object> get props => [
        walletAddress,
      ];
}
//TODO: remove