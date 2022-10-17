import 'package:freezed_annotation/freezed_annotation.dart';

part 'warehouse.freezed.dart';
part 'warehouse.g.dart';

@freezed
class Warehouse with _$Warehouse {
  factory Warehouse({
    @Default('') dynamic WarehouseID,
    @Default('') dynamic WarehouseName,
    @Default('') dynamic WarehouseRegion,
    @Default('') dynamic WarehouseRegionName,
    @Default('') dynamic WarehouseAddress,
    @Default('') dynamic WarehouseCity,
    @Default('') dynamic WarehouseState,
    @Default('') dynamic WarehouseZip,
    @Default('') dynamic WarehousePhone,
  }) = _Warehouse;

  factory Warehouse.fromJson(Map<String, dynamic> json) => _$WarehouseFromJson(json);
}
