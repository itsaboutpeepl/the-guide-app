import 'package:guide_liverpool/models/vesting_state.dart';
import 'package:guide_liverpool/redux/actions/home_page_actions.dart';
import 'package:guide_liverpool/redux/actions/vesting_actions.dart';
import 'package:redux/redux.dart';

final VestingStateReducers = combineReducers<VestingState>(
  [
    TypedReducer<VestingState, UpdateVestingSchedule>(
        _getScheduleByAddressAndIndex),
    TypedReducer<VestingState, UpdateScheduleCount>(_getVestingCount),
    TypedReducer<VestingState, UpdateIsRevoked>(_updateVestingIsRevoked),
    TypedReducer<VestingState, UpdateIsLoading>(_updateVestingIsLoading),
    TypedReducer<VestingState, UpdateVestedChecker>(_updateVestedChecker),
    TypedReducer<VestingState, UpdateVestingScheduleID>(_getScheduleIDs),
    TypedReducer<VestingState, UpdateHasVestingSchedule>(
        _updateHasVestingSchedule),
    TypedReducer<VestingState, UpdateReleasableAmount>(_getReleasableAmount),
    TypedReducer<VestingState, UpdateScheduleStart>(_getScheduleStart),
    TypedReducer<VestingState, UpdateDisplayScheduleID>(_getDisplayScheduleID),
    TypedReducer<VestingState, UpdateIsFullyVested>(_getFullyVestedStatus),
    TypedReducer<VestingState, WithdrawableAmount>(_getWithdrawableAmount),
    TypedReducer<VestingState, UpdateCliffEndTimeDays>(_updateCliffEnd),
    TypedReducer<VestingState, UpdateEndTimeDays>(_updateEndDays),
    TypedReducer<VestingState, UpdateScheduleEnd>(_updateScheduleEnd),
    TypedReducer<VestingState, UpdateCliff>(_updateCliff),
  ],
);

VestingState _getScheduleByAddressAndIndex(
  VestingState state,
  UpdateVestingSchedule action,
) {
  return state.copyWith(vestingSchedule: action.vestingSchedule);
}

VestingState _updateScheduleEnd(
  VestingState state,
  UpdateScheduleEnd action,
) {
  return state.copyWith(scheduleEnd: action.scheduleEnd);
}

VestingState _getVestingCount(
  VestingState state,
  UpdateScheduleCount action,
) {
  return state.copyWith(scheduleCount: action.scheduleCount);
}

VestingState _updateVestingIsRevoked(
  VestingState state,
  UpdateIsRevoked action,
) {
  return state.copyWith(isRevoked: action.isRevoked);
}

VestingState _updateVestingIsLoading(
  VestingState state,
  UpdateIsLoading action,
) {
  return state.copyWith(isLoading: action.isLoading);
}

VestingState _updateVestedChecker(
  VestingState state,
  UpdateVestedChecker action,
) {
  return state.copyWith(vestedChecker: action.vestedChecker);
}

VestingState _getScheduleIDs(
  VestingState state,
  UpdateVestingScheduleID action,
) {
  return state.copyWith(scheduleIDs: action.scheduleIDs);
}

VestingState _updateHasVestingSchedule(
  VestingState state,
  UpdateHasVestingSchedule action,
) {
  return state.copyWith(hasVestingSchedule: action.hasVestingSchedule);
}

VestingState _getReleasableAmount(
  VestingState state,
  UpdateReleasableAmount action,
) {
  return state.copyWith(currentAmountReleasable: state.currentAmountReleasable);
}

VestingState _getScheduleStart(
  VestingState state,
  UpdateScheduleStart action,
) {
  return state.copyWith(scheduleStart: state.scheduleStart);
}

VestingState _getDisplayScheduleID(
  VestingState state,
  UpdateDisplayScheduleID action,
) {
  return state.copyWith(displayScheduleID: state.displayScheduleID);
}

VestingState _getFullyVestedStatus(
  VestingState state,
  UpdateIsFullyVested action,
) {
  return state.copyWith(isContractFullyVested: state.isContractFullyVested);
}

VestingState _getWithdrawableAmount(
  VestingState state,
  WithdrawableAmount action,
) {
  return state.copyWith(withdrawableAmount: state.withdrawableAmount);
}

VestingState _updateCliffEnd(
  VestingState state,
  UpdateCliffEndTimeDays action,
) {
  return state.copyWith(cliffEndDays: state.cliffEndDays);
}

VestingState _updateEndDays(
  VestingState state,
  UpdateEndTimeDays action,
) {
  return state.copyWith(endTimeDays: state.endTimeDays);
}

VestingState _updateCliff(
  VestingState state,
  UpdateCliff action,
) {
  return state.copyWith(cliff: action.cliff);
}
