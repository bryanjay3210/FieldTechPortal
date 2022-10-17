import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
class Vehicle with _$Vehicle {
  factory Vehicle({
    @Default('') dynamic VehicleID,
    @Default('') dynamic VehicleName,
    @Default('') dynamic VehicleVIN,
    @Default('') dynamic VehiclePlate,
    @Default('') dynamic VehicleState,
    @Default('') dynamic VehicleRegionID,
    @Default('') dynamic VehicleAssignedID,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}
