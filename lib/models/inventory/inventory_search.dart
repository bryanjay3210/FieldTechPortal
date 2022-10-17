import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_search.freezed.dart';
part 'inventory_search.g.dart';

@freezed
class InventorySearch with _$InventorySearch {
  factory InventorySearch({
    @JsonKey(name: 'ProductID') required String productID,
    @JsonKey(name: 'ProductName') required String productName,
    @JsonKey(name: 'Locations') required List<dynamic> locations,
  }) = _InventorySearch;

  factory InventorySearch.fromJson(Map<String, dynamic> json) => _$InventorySearchFromJson(json);
}
