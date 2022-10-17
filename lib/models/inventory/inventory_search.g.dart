// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InventorySearch _$$_InventorySearchFromJson(Map<String, dynamic> json) =>
    _$_InventorySearch(
      productID: json['ProductID'] as String,
      productName: json['ProductName'] as String,
      locations: json['Locations'] as List<dynamic>,
    );

Map<String, dynamic> _$$_InventorySearchToJson(_$_InventorySearch instance) =>
    <String, dynamic>{
      'ProductID': instance.productID,
      'ProductName': instance.productName,
      'Locations': instance.locations,
    };
