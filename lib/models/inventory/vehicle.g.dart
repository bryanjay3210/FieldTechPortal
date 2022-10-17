// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Vehicle _$$_VehicleFromJson(Map<String, dynamic> json) => _$_Vehicle(
      VehicleID: json['VehicleID'] ?? '',
      VehicleName: json['VehicleName'] ?? '',
      VehicleVIN: json['VehicleVIN'] ?? '',
      VehiclePlate: json['VehiclePlate'] ?? '',
      VehicleState: json['VehicleState'] ?? '',
      VehicleRegionID: json['VehicleRegionID'] ?? '',
      VehicleAssignedID: json['VehicleAssignedID'] ?? '',
    );

Map<String, dynamic> _$$_VehicleToJson(_$_Vehicle instance) =>
    <String, dynamic>{
      'VehicleID': instance.VehicleID,
      'VehicleName': instance.VehicleName,
      'VehicleVIN': instance.VehicleVIN,
      'VehiclePlate': instance.VehiclePlate,
      'VehicleState': instance.VehicleState,
      'VehicleRegionID': instance.VehicleRegionID,
      'VehicleAssignedID': instance.VehicleAssignedID,
    };
