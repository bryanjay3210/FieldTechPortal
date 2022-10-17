import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_customer.freezed.dart';
part 'inventory_customer.g.dart';

@freezed
class InventoryCustomer with _$InventoryCustomer {
  factory InventoryCustomer({
    @Default('') dynamic Fname,
    @Default('') dynamic Lname,
    @Default('') dynamic CompanyName,
    @Default('') dynamic CustomerID,
    @Default('') dynamic UserID,
    @Default('') dynamic Status,
    @Default('') dynamic CustomerType,
    @Default('') dynamic ParentID,
    @Default('') dynamic IsBuilding,
    @Default('') dynamic IsMaster,
    @Default('') dynamic UserStatus,
  }) = _InventoryCustomer;

  factory InventoryCustomer.fromJson(Map<String, dynamic> json) => _$InventoryCustomerFromJson(json);
}
