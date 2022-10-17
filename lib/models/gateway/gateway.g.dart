// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Gateway _$$_GatewayFromJson(Map<String, dynamic> json) => _$_Gateway(
      GatewayName: json['GatewayName'] ?? '',
      GatewayID: json['GatewayID'] ?? '',
      UUID: json['UUID'] ?? '',
      BuildingID: json['BuildingID'] ?? '',
      UnitName: json['UnitName'] ?? '',
      IPAddress: json['IPAddress'] ?? '',
      Port: json['Port'] ?? '',
      Online: json['Online'] ?? '',
      StatusTime: json['StatusTime'] ?? '',
      RefreshTime: json['RefreshTime'] ?? '',
      MacAddress: json['MacAddress'] ?? '',
      Status: json['Status'] ?? '',
    );

Map<String, dynamic> _$$_GatewayToJson(_$_Gateway instance) =>
    <String, dynamic>{
      'GatewayName': instance.GatewayName,
      'GatewayID': instance.GatewayID,
      'UUID': instance.UUID,
      'BuildingID': instance.BuildingID,
      'UnitName': instance.UnitName,
      'IPAddress': instance.IPAddress,
      'Port': instance.Port,
      'Online': instance.Online,
      'StatusTime': instance.StatusTime,
      'RefreshTime': instance.RefreshTime,
      'MacAddress': instance.MacAddress,
      'Status': instance.Status,
    };
