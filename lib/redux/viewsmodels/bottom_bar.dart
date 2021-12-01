import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';

class BottomBarViewModel extends Equatable {
  final String walletAddress;

  BottomBarViewModel({
    required this.walletAddress,
  });

  static BottomBarViewModel fromStore(Store<AppState> store) {
    return BottomBarViewModel(
      walletAddress: store.state.userState.walletAddress,
    );
  }

  @override
  List<Object> get props => [
        walletAddress,
      ];
}
