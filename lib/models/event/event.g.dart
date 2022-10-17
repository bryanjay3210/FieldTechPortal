// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      EventID: json['EventID'] as String? ?? '',
      TicketID: json['TicketID'] as String? ?? '',
      Name: json['Name'] as String? ?? '',
      EventStart: json['EventStart'] as String? ?? '',
      EventEnd: json['EventEnd'] as String? ?? '',
      EventStatus: json['EventStatus'] as String? ?? '',
      Comment: json['Comment'] ?? '',
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'EventID': instance.EventID,
      'TicketID': instance.TicketID,
      'Name': instance.Name,
      'EventStart': instance.EventStart,
      'EventEnd': instance.EventEnd,
      'EventStatus': instance.EventStatus,
      'Comment': instance.Comment,
    };
