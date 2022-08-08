import 'package:decimal/decimal.dart';
import 'package:guide_liverpool/features/guideHome/helpers/dateTimeFormat.dart';
import 'package:guide_liverpool/features/guideHome/helpers/decimal_handler.dart';
import 'package:guide_liverpool/models/schedules/schedules.dart';
import 'package:guide_liverpool/models/vesting_state.dart';

import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/services/apis/vesting.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:redux/redux.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

import 'dart:convert';

class UpdateVestedTotal {
  final Decimal vestedTotal;

  UpdateVestedTotal({required this.vestedTotal});
}

class UpdateIsRevoked {
  final bool isRevoked;
  UpdateIsRevoked({required this.isRevoked});
}

class UpdateVestingIsLoading {
  final bool isLoading;
  UpdateVestingIsLoading({required this.isLoading});
}

class UpdateVestedChecker {
  final bool vestedChecker;

  UpdateVestedChecker({required this.vestedChecker});
}

class UpdateVestingSchedule {
  final List<Schedules> vestingSchedule;

  UpdateVestingSchedule({required this.vestingSchedule});
}

class UpdateVestingScheduleID {
  final List<dynamic> scheduleIDs;
  UpdateVestingScheduleID({required this.scheduleIDs});
}

class UpdateHasVestingSchedule {
  final bool hasVestingSchedule;

  UpdateHasVestingSchedule({required this.hasVestingSchedule});
}

class UpdateReleasableAmount {
  final Decimal currentAmountReleasable;

  UpdateReleasableAmount({required this.currentAmountReleasable});
}

class UpdateScheduleStart {
  final DateTime scheduleStart;

  UpdateScheduleStart({required this.scheduleStart});
}

class UpdateDisplayScheduleID {
  final String? displayScheduleID;

  UpdateDisplayScheduleID({required this.displayScheduleID});
}

class UpdateScheduleCount {
  final BigInt scheduleCount;

  UpdateScheduleCount({required this.scheduleCount});
}

class UpdateIsFullyVested {
  final bool isContractFullyVested;

  UpdateIsFullyVested({required this.isContractFullyVested});
}

class WithdrawableAmount {
  final BigInt withdrawableAmount;

  WithdrawableAmount({required this.withdrawableAmount});
}

class UpdateCliffEndTimeDays {
  final int cliffEndDays;

  UpdateCliffEndTimeDays({required this.cliffEndDays});
}

class UpdateCliff {
  final DateTime cliff;

  UpdateCliff({required this.cliff});
}

class UpdateEndTimeDays {
  final int endTimeDays;

  UpdateEndTimeDays({required this.endTimeDays});
}

class UpdateScheduleEnd {
  final DateTime scheduleEnd;

  UpdateScheduleEnd({required this.scheduleEnd});
}

ThunkAction getWithdrawableAmount() {
  return (Store store) async {
    try {
      final amount = (await vestingService.web3client.call(
          contract: vestingService.deployedContract,
          function: vestingService.getWithdrawableAmount,
          params: []))[0];

      store.dispatch(WithdrawableAmount(withdrawableAmount: amount));
    } catch (e, s) {
      log.error('ERROR - getWithdrawableAmount $e');
      await Sentry.captureException(e,
          stackTrace: s, hint: 'ERROR - getWithdrawableAmount $e');
    }
  };
}

ThunkAction getScheduleByAddressAndIndex(
    {required int index, required String beneficiaryAddress}) {
  return (Store store) async {
    try {
      // store.dispatch(getSchedulesInfo());

      store.dispatch(SchedulesList());

      final schedule = (await vestingService.web3client.call(
        contract: vestingService.deployedContract,
        function: vestingService.getVestingScheduleByAddressAndIndex,
        params: [EthereumAddress.fromHex(beneficiaryAddress), BigInt.zero],
      ))[0];

      store.dispatch(UpdateIsRevoked(isRevoked: schedule[9]));

      final DateTime scheduleStart = readTimeStampToDate(
        int.parse(
          schedule[3].toString(),
        ),
      );

      store.dispatch(UpdateScheduleStart(scheduleStart: scheduleStart));

      final DateTime scheduleDuration = readTimeStampToDate(
        int.parse(
          schedule[4].toString(),
        ),
      );

      final DateTime scheduleEnd = DateTime.fromMillisecondsSinceEpoch(
          scheduleStart.millisecondsSinceEpoch +
              scheduleDuration.millisecondsSinceEpoch);

      store.dispatch(UpdateScheduleEnd(scheduleEnd: scheduleEnd));

      final DateTime cliff = readTimeStampToDate(
        int.parse(
          schedule[2].toString(),
        ),
      );

      store.dispatch(UpdateCliff(cliff: cliff));

      final Decimal vestedTotal =
          toDecimal(BigInt.parse(schedule[7].toString()), 18);

      store.dispatch(UpdateVestedTotal(vestedTotal: vestedTotal));

      store.dispatch(UpdateVestedChecker(
          vestedChecker: vestedTotal == Decimal.zero ? false : true));

      int endTimeDays = daysBetweenInt(DateTime.now(), scheduleEnd);
      int cliffEndDays = daysBetweenInt(DateTime.now(), cliff);

      cliffEndDays =
          cliffEndDays >= 0 ? daysBetweenInt(DateTime.now(), cliff) : 0;

      store.dispatch(UpdateCliffEndTimeDays(cliffEndDays: cliffEndDays));

      endTimeDays =
          endTimeDays >= 0 ? daysBetweenInt(DateTime.now(), scheduleEnd) : 0;

      store.dispatch(UpdateEndTimeDays(endTimeDays: endTimeDays));

      List<Schedules> vestingSchedules = [];

      vestingSchedules.add(Schedules(
          vestedAmount: vestedTotal.toString(),
          fullyVestedDays: endTimeDays.toString(),
          fullyVestedDateTime: dateFormatter(scheduleEnd),
          cliffEndDays: cliffEndDays.toString(),
          cliffDateTime: dateFormatter(cliff)));

      store.dispatch(UpdateVestingSchedule(vestingSchedule: vestingSchedules));

      bool isContractFullyVested =
          DateTime.now().compareTo(store.state.vestingState.scheduleEnd) > 0
              ? true
              : false;

      store.dispatch(
          UpdateIsFullyVested(isContractFullyVested: isContractFullyVested));

      store.dispatch(UpdateVestingIsLoading(isLoading: false));
    } catch (e, s) {
      log.error('ERROR - getScheduleByAddressAndIndex $e');
      await Sentry.captureException(e,
          stackTrace: s, hint: 'ERROR - getScheduleByAddressAndIndex $e');
    }
  };
}

ThunkAction computeAmountReleasable({required dynamic id}) {
  return (Store store) async {
    try {
      final amountreleasable = (await vestingService.web3client.call(
        contract: vestingService.deployedContract,
        function: vestingService.computeReleasableAmount,
        params: [hexToBytes(id)],
      ))[0];

      store.dispatch(UpdateReleasableAmount(
          currentAmountReleasable: toDecimal(amountreleasable, 18)));
    } catch (e, s) {
      log.error('ERROR - computeAmountReleasable $e');
      await Sentry.captureException(e,
          stackTrace: s, hint: 'ERROR - computeAmountReleasable $e');
    }
  };
}

ThunkAction SchedulesList() {
  return (Store store) async {
    try {
      BigInt scheduleCount = store.state.vestingState.scheduleCount;

      int scheduleAmount = scheduleCount.toInt();

      List<dynamic> schedules = [];

      for (int i = 0; i < scheduleAmount; i++) {
        final vestingScheduleId = (await vestingService.web3client.call(
            contract: vestingService.deployedContract,
            function: vestingService.getSchedulesIDsList,
            params: [
              EthereumAddress.fromHex(store.state.userState.walletAddress),
              BigInt.from(i)
            ]))[0];

        schedules.add(bytesToHex(vestingScheduleId, include0x: true));
      }

      store.dispatch(UpdateVestingScheduleID(scheduleIDs: schedules));

      store.dispatch(
          computeAmountReleasable(id: store.state.vestingState.scheduleIDs[0]));

      String currentScheduleID =
          "${store.state.vestingState.scheduleIDs[0].toString().substring(0, 5)}...${store.state.vestingState.scheduleIDs[0].toString().substring(61, 66)}";

      store.dispatch(
          UpdateDisplayScheduleID(displayScheduleID: currentScheduleID));

      //TODO: fix Null DateTime at this point

    } catch (e, s) {
      log.error('ERROR - getUserVestingSchedulesList $e');
      await Sentry.captureException(e,
          stackTrace: s, hint: 'ERROR - getUserVestingSchedulesList $e');
    }
  };
}

ThunkAction getUserVestingCount() {
  return (Store store) async {
    try {
      final BigInt scheduleCount = (await vestingService.web3client.call(
        contract: vestingService.deployedContract,
        function: vestingService.getVestingSchedulesCountByBeneficiary,
        params: [EthereumAddress.fromHex(store.state.userState.walletAddress)],
      ))[0];

      store.dispatch(UpdateScheduleCount(scheduleCount: scheduleCount));

      store.dispatch(getScheduleByAddressAndIndex(
          index: 0, beneficiaryAddress: store.state.userState.walletAddress));
    } catch (e, s) {
      log.error('ERROR - getUserVestingCount $e');
      await Sentry.captureException(e,
          stackTrace: s, hint: 'ERROR - getUserVestingCount $e');
    }
  };
}

// ThunkAction getSchedulesInfo() {
//   return (Store store) async {
//     try {
//       store.dispatch(SchedulesList());
      
//     } catch (e, s) {
//       log.error('ERROR - getSchedulesInfo $e');
//       await Sentry.captureException(e,
//           stackTrace: s, hint: 'ERROR - getSchedulesInfo $e');
//     }
//   };
// }
