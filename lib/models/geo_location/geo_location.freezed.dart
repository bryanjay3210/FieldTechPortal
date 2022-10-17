// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'geo_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeoLocation _$GeoLocationFromJson(Map<String, dynamic> json) {
  return _GeoLocation.fromJson(json);
}

/// @nodoc
mixin _$GeoLocation {
  String get TechID => throw _privateConstructorUsedError;
  String get Timestamp => throw _privateConstructorUsedError;
  String get Latitude => throw _privateConstructorUsedError;
  String get Longitude => throw _privateConstructorUsedError;
  String get Type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoLocationCopyWith<GeoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoLocationCopyWith<$Res> {
  factory $GeoLocationCopyWith(
          GeoLocation value, $Res Function(GeoLocation) then) =
      _$GeoLocationCopyWithImpl<$Res>;
  $Res call(
      {String TechID,
      String Timestamp,
      String Latitude,
      String Longitude,
      String Type});
}

/// @nodoc
class _$GeoLocationCopyWithImpl<$Res> implements $GeoLocationCopyWith<$Res> {
  _$GeoLocationCopyWithImpl(this._value, this._then);

  final GeoLocation _value;
  // ignore: unused_field
  final $Res Function(GeoLocation) _then;

  @override
  $Res call({
    Object? TechID = freezed,
    Object? Timestamp = freezed,
    Object? Latitude = freezed,
    Object? Longitude = freezed,
    Object? Type = freezed,
  }) {
    return _then(_value.copyWith(
      TechID: TechID == freezed
          ? _value.TechID
          : TechID // ignore: cast_nullable_to_non_nullable
              as String,
      Timestamp: Timestamp == freezed
          ? _value.Timestamp
          : Timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      Latitude: Latitude == freezed
          ? _value.Latitude
          : Latitude // ignore: cast_nullable_to_non_nullable
              as String,
      Longitude: Longitude == freezed
          ? _value.Longitude
          : Longitude // ignore: cast_nullable_to_non_nullable
              as String,
      Type: Type == freezed
          ? _value.Type
          : Type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GeoLocationCopyWith<$Res>
    implements $GeoLocationCopyWith<$Res> {
  factory _$$_GeoLocationCopyWith(
          _$_GeoLocation value, $Res Function(_$_GeoLocation) then) =
      __$$_GeoLocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String TechID,
      String Timestamp,
      String Latitude,
      String Longitude,
      String Type});
}

/// @nodoc
class __$$_GeoLocationCopyWithImpl<$Res> extends _$GeoLocationCopyWithImpl<$Res>
    implements _$$_GeoLocationCopyWith<$Res> {
  __$$_GeoLocationCopyWithImpl(
      _$_GeoLocation _value, $Res Function(_$_GeoLocation) _then)
      : super(_value, (v) => _then(v as _$_GeoLocation));

  @override
  _$_GeoLocation get _value => super._value as _$_GeoLocation;

  @override
  $Res call({
    Object? TechID = freezed,
    Object? Timestamp = freezed,
    Object? Latitude = freezed,
    Object? Longitude = freezed,
    Object? Type = freezed,
  }) {
    return _then(_$_GeoLocation(
      TechID: TechID == freezed
          ? _value.TechID
          : TechID // ignore: cast_nullable_to_non_nullable
              as String,
      Timestamp: Timestamp == freezed
          ? _value.Timestamp
          : Timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      Latitude: Latitude == freezed
          ? _value.Latitude
          : Latitude // ignore: cast_nullable_to_non_nullable
              as String,
      Longitude: Longitude == freezed
          ? _value.Longitude
          : Longitude // ignore: cast_nullable_to_non_nullable
              as String,
      Type: Type == freezed
          ? _value.Type
          : Type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeoLocation implements _GeoLocation {
  _$_GeoLocation(
      {this.TechID = '',
      this.Timestamp = '',
      this.Latitude = '',
      this.Longitude = '',
      this.Type = ''});

  factory _$_GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$$_GeoLocationFromJson(json);

  @override
  @JsonKey()
  final String TechID;
  @override
  @JsonKey()
  final String Timestamp;
  @override
  @JsonKey()
  final String Latitude;
  @override
  @JsonKey()
  final String Longitude;
  @override
  @JsonKey()
  final String Type;

  @override
  String toString() {
    return 'GeoLocation(TechID: $TechID, Timestamp: $Timestamp, Latitude: $Latitude, Longitude: $Longitude, Type: $Type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeoLocation &&
            const DeepCollectionEquality().equals(other.TechID, TechID) &&
            const DeepCollectionEquality().equals(other.Timestamp, Timestamp) &&
            const DeepCollectionEquality().equals(other.Latitude, Latitude) &&
            const DeepCollectionEquality().equals(other.Longitude, Longitude) &&
            const DeepCollectionEquality().equals(other.Type, Type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(TechID),
      const DeepCollectionEquality().hash(Timestamp),
      const DeepCollectionEquality().hash(Latitude),
      const DeepCollectionEquality().hash(Longitude),
      const DeepCollectionEquality().hash(Type));

  @JsonKey(ignore: true)
  @override
  _$$_GeoLocationCopyWith<_$_GeoLocation> get copyWith =>
      __$$_GeoLocationCopyWithImpl<_$_GeoLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoLocationToJson(this);
  }
}

abstract class _GeoLocation implements GeoLocation {
  factory _GeoLocation(
      {final String TechID,
      final String Timestamp,
      final String Latitude,
      final String Longitude,
      final String Type}) = _$_GeoLocation;

  factory _GeoLocation.fromJson(Map<String, dynamic> json) =
      _$_GeoLocation.fromJson;

  @override
  String get TechID => throw _privateConstructorUsedError;
  @override
  String get Timestamp => throw _privateConstructorUsedError;
  @override
  String get Latitude => throw _privateConstructorUsedError;
  @override
  String get Longitude => throw _privateConstructorUsedError;
  @override
  String get Type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GeoLocationCopyWith<_$_GeoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
