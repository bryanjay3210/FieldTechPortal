import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'login.freezed.dart';
part 'login.g.dart';

@freezed
class Login with _$Login {
  factory Login({
    @Default('') dynamic Command,
    @Default('') dynamic Subcommand1,
    @Default('') dynamic UserID,
    @Default('') dynamic UserType,
    @Default('') dynamic UserEmail,
    @Default('') dynamic CustomerID,
    @Default('') dynamic GUID,
    @Default('') dynamic CustomerType,
    @Default('') dynamic BuildingID,
    @Default('') dynamic Status,
    @Default('') dynamic Response,
  }) = _Login;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
}
