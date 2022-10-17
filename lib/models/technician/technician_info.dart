import 'package:freezed_annotation/freezed_annotation.dart';

part 'technician_info.freezed.dart';
part 'technician_info.g.dart';

@freezed
class TechnicianInfo with _$TechnicianInfo {
  factory TechnicianInfo({
    @Default('') dynamic TechID,
    @Default('') dynamic TechName,
    @Default('') dynamic TechPhone,
    @Default('') dynamic TechMobile,
    @Default('') dynamic TechEmail,
    @Default('') dynamic TechFirstName,
    @Default('') dynamic TechLastName,
    @Default('') dynamic TechLBillRate,
    @Default('') dynamic TechLTravelRate,
    @Default('') dynamic TechLCustomerBillRate,
    @Default('') dynamic RegionID,
    @Default('') dynamic RegionName,
  }) = _TechnicianInfo;

  factory TechnicianInfo.fromJson(Map<String, dynamic> json) =>
      _$TechnicianInfoFromJson(json);
}