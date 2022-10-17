// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_in_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListInLocation _$$_ListInLocationFromJson(Map<String, dynamic> json) =>
    _$_ListInLocation(
      ItemID: json['ItemID'] ?? '',
      LocationID: json['LocationID'] ?? '',
      ProductID: json['ProductID'] ?? '',
      SerialNum: json['SerialNum'] ?? '',
      MAC: json['MAC'] ?? '',
      VanID: json['VanID'] ?? '',
      CustomerID: json['CustomerID'] ?? '',
      Quantity: json['Quantity'] ?? '',
      IsChecked: json['IsChecked'] ?? '',
    );

Map<String, dynamic> _$$_ListInLocationToJson(_$_ListInLocation instance) =>
    <String, dynamic>{
      'ItemID': instance.ItemID,
      'LocationID': instance.LocationID,
      'ProductID': instance.ProductID,
      'SerialNum': instance.SerialNum,
      'MAC': instance.MAC,
      'VanID': instance.VanID,
      'CustomerID': instance.CustomerID,
      'Quantity': instance.Quantity,
      'IsChecked': instance.IsChecked,
    };
