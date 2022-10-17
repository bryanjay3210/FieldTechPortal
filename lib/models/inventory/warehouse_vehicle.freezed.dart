// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'warehouse_vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WarehouseVehicle _$WarehouseVehicleFromJson(Map<String, dynamic> json) {
  return _WarehouseVehicle.fromJson(json);
}

/// @nodoc
mixin _$WarehouseVehicle {
  dynamic get ID => throw _privateConstructorUsedError;
  dynamic get Name => throw _privateConstructorUsedError;
  dynamic get IsWarehouse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WarehouseVehicleCopyWith<WarehouseVehicle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarehouseVehicleCopyWith<$Res> {
  factory $WarehouseVehicleCopyWith(
          WarehouseVehicle value, $Res Function(WarehouseVehicle) then) =
      _$WarehouseVehicleCopyWithImpl<$Res>;
  $Res call({dynamic ID, dynamic Name, dynamic IsWarehouse});
}

/// @nodoc
class _$WarehouseVehicleCopyWithImpl<$Res>
    implements $WarehouseVehicleCopyWith<$Res> {
  _$WarehouseVehicleCopyWithImpl(this._value, this._then);

  final WarehouseVehicle _value;
  // ignore: unused_field
  final $Res Function(WarehouseVehicle) _then;

  @override
  $Res call({
    Object? ID = freezed,
    Object? Name = freezed,
    Object? IsWarehouse = freezed,
  }) {
    return _then(_value.copyWith(
      ID: ID == freezed
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Name: Name == freezed
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      IsWarehouse: IsWarehouse == freezed
          ? _value.IsWarehouse
          : IsWarehouse // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_WarehouseVehicleCopyWith<$Res>
    implements $WarehouseVehicleCopyWith<$Res> {
  factory _$$_WarehouseVehicleCopyWith(
          _$_WarehouseVehicle value, $Res Function(_$_WarehouseVehicle) then) =
      __$$_WarehouseVehicleCopyWithImpl<$Res>;
  @override
  $Res call({dynamic ID, dynamic Name, dynamic IsWarehouse});
}

/// @nodoc
class __$$_WarehouseVehicleCopyWithImpl<$Res>
    extends _$WarehouseVehicleCopyWithImpl<$Res>
    implements _$$_WarehouseVehicleCopyWith<$Res> {
  __$$_WarehouseVehicleCopyWithImpl(
      _$_WarehouseVehicle _value, $Res Function(_$_WarehouseVehicle) _then)
      : super(_value, (v) => _then(v as _$_WarehouseVehicle));

  @override
  _$_WarehouseVehicle get _value => super._value as _$_WarehouseVehicle;

  @override
  $Res call({
    Object? ID = freezed,
    Object? Name = freezed,
    Object? IsWarehouse = freezed,
  }) {
    return _then(_$_WarehouseVehicle(
      ID: ID == freezed
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Name: Name == freezed
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      IsWarehouse: IsWarehouse == freezed
          ? _value.IsWarehouse
          : IsWarehouse // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WarehouseVehicle implements _WarehouseVehicle {
  _$_WarehouseVehicle({this.ID = '', this.Name = '', this.IsWarehouse = ''});

  factory _$_WarehouseVehicle.fromJson(Map<String, dynamic> json) =>
      _$$_WarehouseVehicleFromJson(json);

  @override
  @JsonKey()
  final dynamic ID;
  @override
  @JsonKey()
  final dynamic Name;
  @override
  @JsonKey()
  final dynamic IsWarehouse;

  @override
  String toString() {
    return 'WarehouseVehicle(ID: $ID, Name: $Name, IsWarehouse: $IsWarehouse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WarehouseVehicle &&
            const DeepCollectionEquality().equals(other.ID, ID) &&
            const DeepCollectionEquality().equals(other.Name, Name) &&
            const DeepCollectionEquality()
                .equals(other.IsWarehouse, IsWarehouse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ID),
      const DeepCollectionEquality().hash(Name),
      const DeepCollectionEquality().hash(IsWarehouse));

  @JsonKey(ignore: true)
  @override
  _$$_WarehouseVehicleCopyWith<_$_WarehouseVehicle> get copyWith =>
      __$$_WarehouseVehicleCopyWithImpl<_$_WarehouseVehicle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WarehouseVehicleToJson(this);
  }
}

abstract class _WarehouseVehicle implements WarehouseVehicle {
  factory _WarehouseVehicle(
      {final dynamic ID,
      final dynamic Name,
      final dynamic IsWarehouse}) = _$_WarehouseVehicle;

  factory _WarehouseVehicle.fromJson(Map<String, dynamic> json) =
      _$_WarehouseVehicle.fromJson;

  @override
  dynamic get ID => throw _privateConstructorUsedError;
  @override
  dynamic get Name => throw _privateConstructorUsedError;
  @override
  dynamic get IsWarehouse => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WarehouseVehicleCopyWith<_$_WarehouseVehicle> get copyWith =>
      throw _privateConstructorUsedError;
}
