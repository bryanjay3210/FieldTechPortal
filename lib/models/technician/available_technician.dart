import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'available_technician.freezed.dart';
part 'available_technician.g.dart';

@freezed
class AvailableTechnician with _$AvailableTechnician {
  factory AvailableTechnician({
    @Default('') dynamic TechID,
    @Default('') dynamic TechName,
    @Default('') dynamic TechPhone,
    @Default('') dynamic TechMobile,
    @Default('') dynamic TechEmail,
    @Default('') dynamic TechFirstName,
    @Default('') dynamic TechLastName,
    @Default('') dynamic TechLTravelRate,
    @Default('') dynamic TechLBillRate,
    @Default('') dynamic TechLCustomerBillRate,
    @Default('') dynamic RegionID,
    @Default('') dynamic RegionName,
  }) = _AvailableTechnician;

  factory AvailableTechnician.fromJson(Map<String, dynamic> json) =>
      _$AvailableTechnicianFromJson(json);
}

