import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';

class DappPageViewModel extends Equatable {
  final BigInt scheduleCount;
  final String walletAddress;
  final DateTime? scheduleEnd;
  final DateTime? scheduleStart;
  final int endTimeDays;
  final Decimal? vestedTotal;
  final String? currentScheduleID;

  final Decimal currentAmountReleasable;
  final int cliffEndDays;
  final DateTime? cliff;
  final bool isContractFullyVested;

  final bool isLoading;

  DappPageViewModel(
      {required this.scheduleCount,
      required this.walletAddress,
      required this.scheduleEnd,
      required this.scheduleStart,
      required this.endTimeDays,
      required this.vestedTotal,
      required this.currentScheduleID,
      required this.currentAmountReleasable,
      required this.cliffEndDays,
      required this.cliff,
      required this.isContractFullyVested,
      required this.isLoading});

  static DappPageViewModel fromStore(Store<AppState> store) {
    return DappPageViewModel(
      scheduleCount: store.state.vestingState.scheduleCount ?? BigInt.zero,
      walletAddress: store.state.userState.walletAddress,
      scheduleEnd: store.state.vestingState.scheduleEnd,
      endTimeDays: store.state.vestingState.endTimeDays,
      scheduleStart: store.state.vestingState.scheduleStart,
      vestedTotal: store.state.vestingState.vestedTotal,
      currentScheduleID: store.state.vestingState.displayScheduleID,
      currentAmountReleasable:
          store.state.vestingState.currentAmountReleasable ??
              Decimal.fromInt(0),
      cliffEndDays: store.state.vestingState.cliffEndDays,
      cliff: store.state.vestingState.cliff,
      isContractFullyVested: store.state.vestingState.isContractFullyVested,
      isLoading: false,
    );
  }

  @override
  List<Object?> get props => [
        scheduleCount,
        walletAddress,
        scheduleEnd,
        endTimeDays,
        scheduleStart,
        vestedTotal,
        currentScheduleID,
        currentAmountReleasable,
        cliffEndDays,
        cliff,
        isContractFullyVested,
        isLoading,
      ];
}
