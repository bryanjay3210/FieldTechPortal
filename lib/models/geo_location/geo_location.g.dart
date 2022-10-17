// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeoLocation _$$_GeoLocationFromJson(Map<String, dynamic> json) =>
    _$_GeoLocation(
      TechID: json['TechID'] as String? ?? '',
      Timestamp: json['Timestamp'] as String? ?? '',
      Latitude: json['Latitude'] as String? ?? '',
      Longitude: json['Longitude'] as String? ?? '',
      Type: json['Type'] as String? ?? '',
    );

Map<String, dynamic> _$$_GeoLocationToJson(_$_GeoLocation instance) =>
    <String, dynamic>{
      'TechID': instance.TechID,
      'Timestamp': instance.Timestamp,
      'Latitude': instance.Latitude,
      'Longitude': instance.Longitude,
      'Type': instance.Type,
    };
