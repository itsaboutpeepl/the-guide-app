import 'package:decimal/decimal.dart';
import 'package:guide_liverpool/features/guideHome/helpers/dateTimeFormat.dart';
import 'package:guide_liverpool/features/guideHome/helpers/decimal_handler.dart';
import 'package:guide_liverpool/models/schedules/schedules.dart';
import 'package:guide_liverpool/models/vesting_state.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/services/apis/vesting.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:redux/redux.dart';

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
  final List<String> scheduleIDs;
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
  final int scheduleCount;

  UpdateScheduleCount({required this.scheduleCount});
}

class UpdateIsFullyVested {
  final bool isContractFullyVested;

  UpdateIsFullyVested({required this.isContractFullyVested});
}

class WithdrawableAmount {
  final BigInt amount;

  WithdrawableAmount({required this.amount});
}

ThunkAction getWithdrawableAmount() {
  return (Store store) async {
    try {
      final amount = (await vestingService.web3client.call(
          contract: vestingService.deployedContract,
          function: vestingService.getWithdrawableAmount,
          params: []))[0];

      store.dispatch(WithdrawableAmount(amount: amount));
    } catch (e) {
      print(e);
    }
  };
}

ThunkAction getScheduleByAddressAndIndex(
    {required int index, required String beneficiaryAddress}) {
  return (Store store) async {
    try {
      store.dispatch(UpdateVestingIsLoading(isLoading: true));

      // await getSchedulesInfo;

      final schedule = await vestingService.web3client.call(
        contract: vestingService.deployedContract,
        function: vestingService.getVestingScheduleByAddressAndIndex,
        params: [beneficiaryAddress, index],
      );

      store.dispatch(UpdateIsRevoked(isRevoked: schedule[9]));

      final DateTime scheduleStart = readTimeStampToDate(
        int.parse(
          schedule[3].toString(),
        ),
      );

      final DateTime scheduleDuration = readTimeStampToDate(
        int.parse(
          schedule[4].toString(),
        ),
      );

      final DateTime scheduleEnd = DateTime.fromMillisecondsSinceEpoch(
          scheduleStart.millisecondsSinceEpoch +
              scheduleDuration.millisecondsSinceEpoch);

      final DateTime cliff = readTimeStampToDate(
        int.parse(
          schedule[2].toString(),
        ),
      );

      final Decimal vestedTotal =
          toDecimal(BigInt.parse(schedule[7].toString()), 18);

      store.dispatch(UpdateVestedTotal(vestedTotal: vestedTotal));

      store.dispatch(UpdateVestedChecker(
          vestedChecker: vestedTotal == Decimal.zero ? false : true));

      final int endTimeDays = daysBetweenInt(DateTime.now(), scheduleEnd);
      final int cliffEndDays = daysBetweenInt(DateTime.now(), cliff);

      cliffEndDays >= 0 ? daysBetweenInt(DateTime.now(), cliff) : 0;
      endTimeDays >= 0 ? daysBetweenInt(DateTime.now(), scheduleEnd) : 0;

      List<Schedules> vestingSchedules = [];

      vestingSchedules.add(Schedules(
          vestedAmount: vestedTotal.toString(),
          fullyVestedDays: endTimeDays.toString(),
          fullyVestedDateTime: dateFormatter(scheduleEnd),
          cliffEndDays: cliffEndDays.toString(),
          cliffDateTime: dateFormatter(cliff)));

      store.dispatch(UpdateVestingSchedule(vestingSchedule: vestingSchedules));
    } catch (e, s) {
      log.error('ERROR - getScheduleByAddressAndIndex $e');
      await Sentry.captureException(e,
          stackTrace: s, hint: 'ERROR - getScheduleByAddressAndIndex $e');
    }
  };
}

ThunkAction computeAmountReleasable({required String id}) {
  return (Store store) async {
    try {
      final amountreleasable = await vestingService.web3client.call(
        contract: vestingService.deployedContract,
        function: vestingService.computeReleasableAmount,
        params: [id],
      );

      // store.dispatch(UpdateReleasableAmount(currentAmountReleasable: toDecimal(currentAmount))
    } catch (e, s) {
      log.error('ERROR - computeAmountReleasable $e');
      await Sentry.captureException(e,
          stackTrace: s, hint: 'ERROR - computeAmountReleasable $e');
    }
  };
}

// ThunkAction getUserVestingSchedulesList()  {
//   return (Store store) async {
//   BigInt scheduleCount = store.state.vestingState.scheduleCount;

//   List<String> schedules = [];

//   // for (int i = 0; i < scheduleCount.toInt(); i++) {
//   //   final vestingScheduleId = await vestingContract
//   //       .call('computeVestingScheduleIdForAddressAndIndex', [homeController.currentAddress.value, BigInt.from(i)]);
//   //   schedules.add(vestingScheduleId);
//   }

//   return schedules;
//   };
// }

ThunkAction getUserVestingCount({required String beneficiary}) {
  return (Store store) async {
    final int scheduleCount = (await vestingService.web3client.call(
      contract: vestingService.deployedContract,
      function: vestingService.getVestingSchedulesCountByBeneficiary,
      params: [beneficiary],
    ))[0];

    store.dispatch(UpdateScheduleCount(scheduleCount: scheduleCount));
  };
}

// ThunkAction getSchedulesInfo() {
//   return (Store store) async {
//     try {
//       List<String> scheduleIDs = await getUserVestingSchedulesList();
//       Decimal currentAmountReleasable = toDecimal(await computeAmountReleasable(scheduleIDs[0]), 18)

    
//     store.dispatch(UpdateVestingIsLoading(isLoading: false));
//     String currentScheduleID("${scheduleIDs[0].substring(0, 5)}...${scheduleIDs[0].substring(61, 66)}");

//     bool isContractFullyVested = DateTime.now().compareTo(scheduleEnd.value) > 0 ? true : false;

      
     
//     } catch (e,s) {
//      log.error('ERROR - getSchedulesInfo $e');
//      await Sentry.captureException(e, stackTrace: s, hint: 'ERROR - getSchedulesInfo $e');
   
//   } finally {
    
//   }
// };

// }



