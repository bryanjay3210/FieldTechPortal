// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TripRate _$$_TripRateFromJson(Map<String, dynamic> json) => _$_TripRate(
      Command: json['Command'] ?? '',
      Subcommand1: json['Subcommand1'] ?? '',
      Miles: json['Miles'] ?? '',
      TechRate: json['TechRate'] ?? '',
      TechRateType: json['TechRateType'] ?? '',
      TotalCharge: json['TotalCharge'] ?? '',
      Status: json['Status'] ?? '',
    );

Map<String, dynamic> _$$_TripRateToJson(_$_TripRate instance) =>
    <String, dynamic>{
      'Command': instance.Command,
      'Subcommand1': instance.Subcommand1,
      'Miles': instance.Miles,
      'TechRate': instance.TechRate,
      'TechRateType': instance.TechRateType,
      'TotalCharge': instance.TotalCharge,
      'Status': instance.Status,
    };
