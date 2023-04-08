// import 'package:guide_liverpool/models/vesting_state.dart';
// import 'package:guide_liverpool/redux/actions/vesting_actions.dart';
// import 'package:redux/redux.dart';

// final VestingStateReducers = combineReducers<VestingState>(
//   [
//     TypedReducer<VestingState, UpdateVestingSchedule>(
//         _getScheduleByAddressAndIndex),
//     TypedReducer<VestingState, UpdateScheduleCount>(_getVestingCount),
//     TypedReducer<VestingState, UpdateIsRevoked>(_updateVestingIsRevoked),
//     TypedReducer<VestingState, UpdateVestedChecker>(_updateVestedChecker),
//     TypedReducer<VestingState, UpdateVestingScheduleID>(_getScheduleIDs),
//     TypedReducer<VestingState, UpdateHasVestingSchedule>(
//         _updateHasVestingSchedule),
//     TypedReducer<VestingState, UpdateReleasableAmount>(_getReleasableAmount),
//     TypedReducer<VestingState, UpdateScheduleStart>(_getScheduleStart),
//     TypedReducer<VestingState, UpdateDisplayScheduleID>(_getDisplayScheduleID),
//     TypedReducer<VestingState, UpdateIsFullyVested>(_getFullyVestedStatus),
//     TypedReducer<VestingState, WithdrawableAmount>(_getWithdrawableAmount),
//     TypedReducer<VestingState, UpdateCliffEndTimeDays>(_updateCliffEnd),
//     TypedReducer<VestingState, UpdateEndTimeDays>(_updateEndDays),
//     TypedReducer<VestingState, UpdateScheduleEnd>(_updateScheduleEnd),
//     TypedReducer<VestingState, UpdateCliff>(_updateCliff),
//     TypedReducer<VestingState, UpdateVestedTotal>(_updateVestedTotal),
//   ],
// );

// VestingState _getScheduleByAddressAndIndex(
//   VestingState state,
//   UpdateVestingSchedule action,
// ) {
//   return state.copyWith(vestingSchedule: action.vestingSchedule);
// }

// VestingState _updateScheduleEnd(
//   VestingState state,
//   UpdateScheduleEnd action,
// ) {
//   return state.copyWith(scheduleEnd: action.scheduleEnd);
// }

// VestingState _getVestingCount(
//   VestingState state,
//   UpdateScheduleCount action,
// ) {
//   return state.copyWith(scheduleCount: action.scheduleCount);
// }

// VestingState _updateVestingIsRevoked(
//   VestingState state,
//   UpdateIsRevoked action,
// ) {
//   return state.copyWith(isRevoked: action.isRevoked);
// }

// VestingState _updateVestedChecker(
//   VestingState state,
//   UpdateVestedChecker action,
// ) {
//   return state.copyWith(vestedChecker: action.vestedChecker);
// }

// VestingState _getScheduleIDs(
//   VestingState state,
//   UpdateVestingScheduleID action,
// ) {
//   return state.copyWith(scheduleIDs: action.scheduleIDs);
// }

// VestingState _updateHasVestingSchedule(
//   VestingState state,
//   UpdateHasVestingSchedule action,
// ) {
//   return state.copyWith(hasVestingSchedule: action.hasVestingSchedule);
// }

// VestingState _getReleasableAmount(
//   VestingState state,
//   UpdateReleasableAmount action,
// ) {
//   return state.copyWith(
//       currentAmountReleasable: action.currentAmountReleasable);
// }

// VestingState _getScheduleStart(
//   VestingState state,
//   UpdateScheduleStart action,
// ) {
//   return state.copyWith(scheduleStart: action.scheduleStart);
// }

// VestingState _getDisplayScheduleID(
//   VestingState state,
//   UpdateDisplayScheduleID action,
// ) {
//   return state.copyWith(displayScheduleID: action.displayScheduleID);
// }

// VestingState _getFullyVestedStatus(
//   VestingState state,
//   UpdateIsFullyVested action,
// ) {
//   return state.copyWith(isContractFullyVested: action.isContractFullyVested);
// }

// VestingState _getWithdrawableAmount(
//   VestingState state,
//   WithdrawableAmount action,
// ) {
//   return state.copyWith(withdrawableAmount: action.withdrawableAmount);
// }

// VestingState _updateCliffEnd(
//   VestingState state,
//   UpdateCliffEndTimeDays action,
// ) {
//   return state.copyWith(cliffEndDays: action.cliffEndDays);
// }

// VestingState _updateEndDays(
//   VestingState state,
//   UpdateEndTimeDays action,
// ) {
//   return state.copyWith(endTimeDays: action.endTimeDays);
// }

// VestingState _updateCliff(
//   VestingState state,
//   UpdateCliff action,
// ) {
//   return state.copyWith(cliff: action.cliff);
// }

// VestingState _updateVestedTotal(
//   VestingState state,
//   UpdateVestedTotal action,
// ) {
//   return state.copyWith(vestedTotal: action.vestedTotal);
// }
