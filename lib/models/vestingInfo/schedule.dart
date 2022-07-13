class Schedules {
  final String? scheduleID;
  final String? vestedAmount;
  final String? fullyVestedDays;
  final String? fullyVestedDateTime;
  final String? withdrawableAmount;
  final String? cliffEndDays;
  final String? cliffDateTime;
  final bool? isRevoked;

  Schedules({
    required this.scheduleID,
    required this.vestedAmount,
    required this.fullyVestedDays,
    required this.fullyVestedDateTime,
    required this.withdrawableAmount,
    required this.cliffEndDays,
    required this.cliffDateTime,
    required this.isRevoked,
  });
}
