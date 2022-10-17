import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer {
  factory Customer({
    @Default('') dynamic Name,
    @Default('') dynamic PhoneHome,
    @Default('') dynamic PhoneWork,
    @Default('') dynamic PhoneCell,
    @Default('') dynamic Address,
    @Default('') dynamic BuildingName,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
