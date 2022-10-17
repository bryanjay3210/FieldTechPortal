// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InventoryCustomer _$$_InventoryCustomerFromJson(Map<String, dynamic> json) =>
    _$_InventoryCustomer(
      Fname: json['Fname'] ?? '',
      Lname: json['Lname'] ?? '',
      CompanyName: json['CompanyName'] ?? '',
      CustomerID: json['CustomerID'] ?? '',
      UserID: json['UserID'] ?? '',
      Status: json['Status'] ?? '',
      CustomerType: json['CustomerType'] ?? '',
      ParentID: json['ParentID'] ?? '',
      IsBuilding: json['IsBuilding'] ?? '',
      IsMaster: json['IsMaster'] ?? '',
      UserStatus: json['UserStatus'] ?? '',
    );

Map<String, dynamic> _$$_InventoryCustomerToJson(
        _$_InventoryCustomer instance) =>
    <String, dynamic>{
      'Fname': instance.Fname,
      'Lname': instance.Lname,
      'CompanyName': instance.CompanyName,
      'CustomerID': instance.CustomerID,
      'UserID': instance.UserID,
      'Status': instance.Status,
      'CustomerType': instance.CustomerType,
      'ParentID': instance.ParentID,
      'IsBuilding': instance.IsBuilding,
      'IsMaster': instance.IsMaster,
      'UserStatus': instance.UserStatus,
    };
