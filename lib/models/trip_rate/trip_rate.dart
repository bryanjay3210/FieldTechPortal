import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'trip_rate.freezed.dart';
part 'trip_rate.g.dart';

@freezed
class TripRate with _$TripRate {
  factory TripRate({
    @Default('') dynamic Command,
    @Default('') dynamic Subcommand1,
    @Default('') dynamic Miles,
    @Default('') dynamic TechRate,
    @Default('') dynamic TechRateType,
    @Default('') dynamic TotalCharge,
    @Default('') dynamic Status,
  }) = _TripRate;

  factory TripRate.fromJson(Map<String, dynamic> json) =>
      _$TripRateFromJson(json);
}
