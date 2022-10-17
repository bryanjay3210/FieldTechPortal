// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  dynamic get VehicleID => throw _privateConstructorUsedError;
  dynamic get VehicleName => throw _privateConstructorUsedError;
  dynamic get VehicleVIN => throw _privateConstructorUsedError;
  dynamic get VehiclePlate => throw _privateConstructorUsedError;
  dynamic get VehicleState => throw _privateConstructorUsedError;
  dynamic get VehicleRegionID => throw _privateConstructorUsedError;
  dynamic get VehicleAssignedID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res>;
  $Res call(
      {dynamic VehicleID,
      dynamic VehicleName,
      dynamic VehicleVIN,
      dynamic VehiclePlate,
      dynamic VehicleState,
      dynamic VehicleRegionID,
      dynamic VehicleAssignedID});
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res> implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  final Vehicle _value;
  // ignore: unused_field
  final $Res Function(Vehicle) _then;

  @override
  $Res call({
    Object? VehicleID = freezed,
    Object? VehicleName = freezed,
    Object? VehicleVIN = freezed,
    Object? VehiclePlate = freezed,
    Object? VehicleState = freezed,
    Object? VehicleRegionID = freezed,
    Object? VehicleAssignedID = freezed,
  }) {
    return _then(_value.copyWith(
      VehicleID: VehicleID == freezed
          ? _value.VehicleID
          : VehicleID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VehicleName: VehicleName == freezed
          ? _value.VehicleName
          : VehicleName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VehicleVIN: VehicleVIN == freezed
          ? _value.VehicleVIN
          : VehicleVIN // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VehiclePlate: VehiclePlate == freezed
          ? _value.VehiclePlate
          : VehiclePlate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VehicleState: VehicleState == freezed
          ? _value.VehicleState
          : VehicleState // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VehicleRegionID: VehicleRegionID == freezed
          ? _value.VehicleRegionID
          : VehicleRegionID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VehicleAssignedID: VehicleAssignedID == freezed
          ? _value.VehicleAssignedID
          : VehicleAssignedID // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_VehicleCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$_VehicleCopyWith(
          _$_Vehicle value, $Res Function(_$_Vehicle) then) =
      __$$_VehicleCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic VehicleID,
      dynamic VehicleName,
      dynamic VehicleVIN,
      dynamic VehiclePlate,
      dynamic VehicleState,
      dynamic VehicleRegionID,
      dynamic VehicleAssignedID});
}

/// @nodoc
class __$$_VehicleCopyWithImpl<$Res> extends _$VehicleCopyWithImpl<$Res>
    implements _$$_VehicleCopyWith<$Res> {
  __$$_VehicleCopyWithImpl(_$_Vehicle _value, $Res Function(_$_Vehicle) _then)
      : super(_value, (v) => _then(v as _$_Vehicle));

  @override
  _$_Vehicle get _value => super._value as _$_Vehicle;

  @override
  $Res call({
    Object? VehicleID = freezed,
    Object? VehicleName = freezed,
    Object? VehicleVIN = freezed,
    Object? VehiclePlate = freezed,
    Object? VehicleState = freezed,
    Object? VehicleRegionID = freezed,
    Object? VehicleAssignedID = freezed,
  }) {
    return _then(_$_Vehicle(
      VehicleID: VehicleID == freezed
          ? _value.VehicleID
          : VehicleID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VehicleName: VehicleName == freezed
          ? _value.VehicleName
          : VehicleName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VehicleVIN: VehicleVIN == freezed
          ? _value.VehicleVIN
          : VehicleVIN // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VehiclePlate: VehiclePlate == freezed
          ? _value.VehiclePlate
          : VehiclePlate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VehicleState: VehicleState == freezed
          ? _value.VehicleState
          : VehicleState // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VehicleRegionID: VehicleRegionID == freezed
          ? _value.VehicleRegionID
          : VehicleRegionID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      VehicleAssignedID: VehicleAssignedID == freezed
          ? _value.VehicleAssignedID
          : VehicleAssignedID // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Vehicle implements _Vehicle {
  _$_Vehicle(
      {this.VehicleID = '',
      this.VehicleName = '',
      this.VehicleVIN = '',
      this.VehiclePlate = '',
      this.VehicleState = '',
      this.VehicleRegionID = '',
      this.VehicleAssignedID = ''});

  factory _$_Vehicle.fromJson(Map<String, dynamic> json) =>
      _$$_VehicleFromJson(json);

  @override
  @JsonKey()
  final dynamic VehicleID;
  @override
  @JsonKey()
  final dynamic VehicleName;
  @override
  @JsonKey()
  final dynamic VehicleVIN;
  @override
  @JsonKey()
  final dynamic VehiclePlate;
  @override
  @JsonKey()
  final dynamic VehicleState;
  @override
  @JsonKey()
  final dynamic VehicleRegionID;
  @override
  @JsonKey()
  final dynamic VehicleAssignedID;

  @override
  String toString() {
    return 'Vehicle(VehicleID: $VehicleID, VehicleName: $VehicleName, VehicleVIN: $VehicleVIN, VehiclePlate: $VehiclePlate, VehicleState: $VehicleState, VehicleRegionID: $VehicleRegionID, VehicleAssignedID: $VehicleAssignedID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Vehicle &&
            const DeepCollectionEquality().equals(other.VehicleID, VehicleID) &&
            const DeepCollectionEquality()
                .equals(other.VehicleName, VehicleName) &&
            const DeepCollectionEquality()
                .equals(other.VehicleVIN, VehicleVIN) &&
            const DeepCollectionEquality()
                .equals(other.VehiclePlate, VehiclePlate) &&
            const DeepCollectionEquality()
                .equals(other.VehicleState, VehicleState) &&
            const DeepCollectionEquality()
                .equals(other.VehicleRegionID, VehicleRegionID) &&
            const DeepCollectionEquality()
                .equals(other.VehicleAssignedID, VehicleAssignedID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(VehicleID),
      const DeepCollectionEquality().hash(VehicleName),
      const DeepCollectionEquality().hash(VehicleVIN),
      const DeepCollectionEquality().hash(VehiclePlate),
      const DeepCollectionEquality().hash(VehicleState),
      const DeepCollectionEquality().hash(VehicleRegionID),
      const DeepCollectionEquality().hash(VehicleAssignedID));

  @JsonKey(ignore: true)
  @override
  _$$_VehicleCopyWith<_$_Vehicle> get copyWith =>
      __$$_VehicleCopyWithImpl<_$_Vehicle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VehicleToJson(this);
  }
}

abstract class _Vehicle implements Vehicle {
  factory _Vehicle(
      {final dynamic VehicleID,
      final dynamic VehicleName,
      final dynamic VehicleVIN,
      final dynamic VehiclePlate,
      final dynamic VehicleState,
      final dynamic VehicleRegionID,
      final dynamic VehicleAssignedID}) = _$_Vehicle;

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$_Vehicle.fromJson;

  @override
  dynamic get VehicleID => throw _privateConstructorUsedError;
  @override
  dynamic get VehicleName => throw _privateConstructorUsedError;
  @override
  dynamic get VehicleVIN => throw _privateConstructorUsedError;
  @override
  dynamic get VehiclePlate => throw _privateConstructorUsedError;
  @override
  dynamic get VehicleState => throw _privateConstructorUsedError;
  @override
  dynamic get VehicleRegionID => throw _privateConstructorUsedError;
  @override
  dynamic get VehicleAssignedID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_VehicleCopyWith<_$_Vehicle> get copyWith =>
      throw _privateConstructorUsedError;
}
