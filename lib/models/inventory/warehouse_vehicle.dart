import 'package:freezed_annotation/freezed_annotation.dart';

part 'warehouse_vehicle.freezed.dart';
part 'warehouse_vehicle.g.dart';

@freezed
class WarehouseVehicle with _$WarehouseVehicle {
  factory WarehouseVehicle({
    @Default('') dynamic ID,
    @Default('') dynamic Name,
    @Default('') dynamic IsWarehouse,
  }) = _WarehouseVehicle;

  factory WarehouseVehicle.fromJson(Map<String, dynamic> json) => _$WarehouseVehicleFromJson(json);
}
