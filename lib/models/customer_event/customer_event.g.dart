// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerEvent _$$_CustomerEventFromJson(Map<String, dynamic> json) =>
    _$_CustomerEvent(
      EventID: json['EventID'] ?? '',
      CustomerID: json['CustomerID'] ?? '',
      EventStartTime: json['EventStartTime'] ?? '',
      EventEndTime: json['EventEndTime'] ?? '',
      EventOwnerID: json['EventOwnerID'] ?? '',
      EventType: json['EventType'] ?? '',
      EventDesc: json['EventDesc'] ?? '',
      EventLoc: json['EventLoc'] ?? '',
      EventNote: json['EventNote'] ?? '',
      EventStatus: json['EventStatus'] ?? '',
      EventPriority: json['EventPriority'] ?? '',
      email: json['email'] ?? '',
    );

Map<String, dynamic> _$$_CustomerEventToJson(_$_CustomerEvent instance) =>
    <String, dynamic>{
      'EventID': instance.EventID,
      'CustomerID': instance.CustomerID,
      'EventStartTime': instance.EventStartTime,
      'EventEndTime': instance.EventEndTime,
      'EventOwnerID': instance.EventOwnerID,
      'EventType': instance.EventType,
      'EventDesc': instance.EventDesc,
      'EventLoc': instance.EventLoc,
      'EventNote': instance.EventNote,
      'EventStatus': instance.EventStatus,
      'EventPriority': instance.EventPriority,
      'email': instance.email,
    };
