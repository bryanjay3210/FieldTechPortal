import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'unit.freezed.dart';
part 'unit.g.dart';

@freezed
class Unit with _$Unit {
  factory Unit(
      {@Default('') dynamic UnitName,
      @Default('') dynamic UnitID,
      @Default('') dynamic Occupied,
      @Default('') dynamic GatewayUUID,
      @Default('') dynamic GatewayID,
      @Default('') dynamic Online}) = _Unit;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
}
