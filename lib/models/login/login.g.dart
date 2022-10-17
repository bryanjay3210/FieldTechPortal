// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Login _$$_LoginFromJson(Map<String, dynamic> json) => _$_Login(
      Command: json['Command'] ?? '',
      Subcommand1: json['Subcommand1'] ?? '',
      UserID: json['UserID'] ?? '',
      UserType: json['UserType'] ?? '',
      UserEmail: json['UserEmail'] ?? '',
      CustomerID: json['CustomerID'] ?? '',
      GUID: json['GUID'] ?? '',
      CustomerType: json['CustomerType'] ?? '',
      BuildingID: json['BuildingID'] ?? '',
      Status: json['Status'] ?? '',
      Response: json['Response'] ?? '',
    );

Map<String, dynamic> _$$_LoginToJson(_$_Login instance) => <String, dynamic>{
      'Command': instance.Command,
      'Subcommand1': instance.Subcommand1,
      'UserID': instance.UserID,
      'UserType': instance.UserType,
      'UserEmail': instance.UserEmail,
      'CustomerID': instance.CustomerID,
      'GUID': instance.GUID,
      'CustomerType': instance.CustomerType,
      'BuildingID': instance.BuildingID,
      'Status': instance.Status,
      'Response': instance.Response,
    };
