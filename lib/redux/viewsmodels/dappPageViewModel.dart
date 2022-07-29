import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';

class DappPageViewModel extends Equatable {
  final int scheduleCount;
  final String walletAddress;
  final DateTime? scheduleEnd;
  final int endTimeDays;
  final Decimal vestedTotal;
  final String? currentScheduleID;
  final Decimal currentAmountReleasable;
  final int cliffEndDays;
  final DateTime? cliff;
  final bool isContractFullyVested;

  DappPageViewModel({
    required this.scheduleCount,
    required this.walletAddress,
    required this.scheduleEnd,
    required this.endTimeDays,
    required this.vestedTotal,
    required this.currentScheduleID,
    required this.currentAmountReleasable,
    required this.cliffEndDays,
    required this.cliff,
    required this.isContractFullyVested,
  });

  static DappPageViewModel fromStore(Store<AppState> store) {
    return DappPageViewModel(
      scheduleCount: store.state.vestingState.scheduleCount,
      walletAddress: store.state.userState.walletAddress,
      scheduleEnd: store.state.vestingState.scheduleEnd,
      endTimeDays: store.state.vestingState.endTimeDays,
      vestedTotal: store.state.vestingState.vestingSchedule[1] as Decimal,
      currentScheduleID: store.state.vestingState.displayScheduleID,
      currentAmountReleasable: store.state.vestingState.currentAmountReleasable,
      cliffEndDays: store.state.vestingState.cliffEndDays,
      cliff: store.state.vestingState.cliff,
      isContractFullyVested: store.state.vestingState.isContractFullyVested,
    );
  }

  @override
  List<Object?> get props => [
        scheduleCount,
        walletAddress,
        scheduleEnd,
        endTimeDays,
        vestedTotal,
        currentScheduleID,
        currentAmountReleasable,
        cliffEndDays,
        cliff,
        isContractFullyVested,
      ];
}
