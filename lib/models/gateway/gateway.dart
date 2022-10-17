import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'gateway.freezed.dart';
part 'gateway.g.dart';

@freezed
class Gateway with _$Gateway {
  factory Gateway({
    @Default('') dynamic GatewayName,
    @Default('') dynamic GatewayID,
    @Default('') dynamic UUID,
    @Default('') dynamic BuildingID,
    @Default('') dynamic UnitName,
    @Default('') dynamic IPAddress,
    @Default('') dynamic Port,
    @Default('') dynamic Online,
    @Default('') dynamic StatusTime,
    @Default('') dynamic RefreshTime,
    @Default('') dynamic MacAddress,
    @Default('') dynamic Status,
  }) = _Gateway;

  factory Gateway.fromJson(Map<String, dynamic> json) =>
      _$GatewayFromJson(json);
}
