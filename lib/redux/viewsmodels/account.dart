import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:guide_liverpool/models/app_state.dart';

class AccountViewModel extends Equatable {
  const AccountViewModel({
    required this.walletAddress,
    required this.avatarUrl,
    required this.displayName,
    required this.isBackup,
    required this.firstName,
    required this.mnemonic,
  });

  factory AccountViewModel.fromStore(Store<AppState> store) {
    return AccountViewModel(
      isBackup: store.state.userState.backup,
      displayName: store.state.userState.displayName,
      avatarUrl: store.state.userState.avatarUrl,
      walletAddress: store.state.userState.walletAddress,
      firstName: store.state.userState.displayName.split(' ')[0],
      mnemonic: store.state.userState.mnemonic,
    );
  }

  final String walletAddress;
  final String avatarUrl;
  final String displayName;
  final bool isBackup;
  final String firstName;
  final List<String> mnemonic;

  @override
  List<Object> get props => [
        walletAddress,
        avatarUrl,
        displayName,
        isBackup,
      ];
}
