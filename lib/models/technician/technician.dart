import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'technician.freezed.dart';
part 'technician.g.dart';

@freezed
class Technician with _$Technician {
  factory Technician({
    @Default('') dynamic TechID,
    @Default('') dynamic TravelRate,
    @Default('') dynamic CustomerBillRate,
    @Default('') dynamic BillRate,
  }) = _Technician;

  factory Technician.fromJson(Map<String, dynamic> json) =>
      _$TechnicianFromJson(json);
}
