import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:redux/redux.dart';

class ProfileViewModel extends Equatable {
  final String phone;
  final String walletAddress;
  final String avatarUrl;
  final String displayName;
  final void Function(String displayName) updateDisplayName;

  ProfileViewModel({
    required this.phone,
    required this.walletAddress,
    required this.displayName,
    required this.avatarUrl,
    required this.updateDisplayName,
  });

  static ProfileViewModel fromStore(Store<AppState> store) {
    return ProfileViewModel(
      displayName: store.state.userState.displayName,
      phone: store.state.userState.phoneNumber,
      avatarUrl: store.state.userState.avatarUrl,
      walletAddress: store.state.userState.walletAddress,
      updateDisplayName: (displayName) {
        store.dispatch(updateDisplayNameCall(displayName));
      },
    );
  }

  @override
  List get props => [
        walletAddress,
        phone,
        displayName,
        avatarUrl,
      ];
}
