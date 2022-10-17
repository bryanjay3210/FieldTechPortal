import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_in_location.freezed.dart';
part 'list_in_location.g.dart';

@freezed
class ListInLocation with _$ListInLocation {
  factory ListInLocation({
    @Default('') dynamic ItemID,
    @Default('') dynamic LocationID,
    @Default('') dynamic ProductID,
    @Default('') dynamic SerialNum,
    @Default('') dynamic MAC,
    @Default('') dynamic VanID,
    @Default('') dynamic CustomerID,
    @Default('') dynamic Quantity,
    @Default('') dynamic IsChecked,
  }) = _ListInLocation;

  factory ListInLocation.fromJson(Map<String, dynamic> json) => _$ListInLocationFromJson(json);
}
