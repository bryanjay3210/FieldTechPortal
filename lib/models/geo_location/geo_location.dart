import 'package:freezed_annotation/freezed_annotation.dart';
part 'geo_location.freezed.dart';
part 'geo_location.g.dart';

@freezed
class GeoLocation with _$GeoLocation {
  factory GeoLocation({
    @Default('') String TechID,
    @Default('') String Timestamp,
    @Default('') String Latitude,
    @Default('') String Longitude,
    @Default('') String Type,
  }) = _GeoLocation;

  factory GeoLocation.fromJson(Map<String, dynamic> json) => _$GeoLocationFromJson(json);
}

