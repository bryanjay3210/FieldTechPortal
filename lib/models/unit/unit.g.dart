// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Unit _$$_UnitFromJson(Map<String, dynamic> json) => _$_Unit(
      UnitName: json['UnitName'] ?? '',
      UnitID: json['UnitID'] ?? '',
      Occupied: json['Occupied'] ?? '',
      GatewayUUID: json['GatewayUUID'] ?? '',
      GatewayID: json['GatewayID'] ?? '',
      Online: json['Online'] ?? '',
    );

Map<String, dynamic> _$$_UnitToJson(_$_Unit instance) => <String, dynamic>{
      'UnitName': instance.UnitName,
      'UnitID': instance.UnitID,
      'Occupied': instance.Occupied,
      'GatewayUUID': instance.GatewayUUID,
      'GatewayID': instance.GatewayID,
      'Online': instance.Online,
    };
