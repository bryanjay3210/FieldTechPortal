// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'technician.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Technician _$TechnicianFromJson(Map<String, dynamic> json) {
  return _Technician.fromJson(json);
}

/// @nodoc
mixin _$Technician {
  dynamic get TechID => throw _privateConstructorUsedError;
  dynamic get TravelRate => throw _privateConstructorUsedError;
  dynamic get CustomerBillRate => throw _privateConstructorUsedError;
  dynamic get BillRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TechnicianCopyWith<Technician> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechnicianCopyWith<$Res> {
  factory $TechnicianCopyWith(
          Technician value, $Res Function(Technician) then) =
      _$TechnicianCopyWithImpl<$Res>;
  $Res call(
      {dynamic TechID,
      dynamic TravelRate,
      dynamic CustomerBillRate,
      dynamic BillRate});
}

/// @nodoc
class _$TechnicianCopyWithImpl<$Res> implements $TechnicianCopyWith<$Res> {
  _$TechnicianCopyWithImpl(this._value, this._then);

  final Technician _value;
  // ignore: unused_field
  final $Res Function(Technician) _then;

  @override
  $Res call({
    Object? TechID = freezed,
    Object? TravelRate = freezed,
    Object? CustomerBillRate = freezed,
    Object? BillRate = freezed,
  }) {
    return _then(_value.copyWith(
      TechID: TechID == freezed
          ? _value.TechID
          : TechID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      TravelRate: TravelRate == freezed
          ? _value.TravelRate
          : TravelRate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      CustomerBillRate: CustomerBillRate == freezed
          ? _value.CustomerBillRate
          : CustomerBillRate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      BillRate: BillRate == freezed
          ? _value.BillRate
          : BillRate // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_TechnicianCopyWith<$Res>
    implements $TechnicianCopyWith<$Res> {
  factory _$$_TechnicianCopyWith(
          _$_Technician value, $Res Function(_$_Technician) then) =
      __$$_TechnicianCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic TechID,
      dynamic TravelRate,
      dynamic CustomerBillRate,
      dynamic BillRate});
}

/// @nodoc
class __$$_TechnicianCopyWithImpl<$Res> extends _$TechnicianCopyWithImpl<$Res>
    implements _$$_TechnicianCopyWith<$Res> {
  __$$_TechnicianCopyWithImpl(
      _$_Technician _value, $Res Function(_$_Technician) _then)
      : super(_value, (v) => _then(v as _$_Technician));

  @override
  _$_Technician get _value => super._value as _$_Technician;

  @override
  $Res call({
    Object? TechID = freezed,
    Object? TravelRate = freezed,
    Object? CustomerBillRate = freezed,
    Object? BillRate = freezed,
  }) {
    return _then(_$_Technician(
      TechID: TechID == freezed
          ? _value.TechID
          : TechID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      TravelRate: TravelRate == freezed
          ? _value.TravelRate
          : TravelRate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      CustomerBillRate: CustomerBillRate == freezed
          ? _value.CustomerBillRate
          : CustomerBillRate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      BillRate: BillRate == freezed
          ? _value.BillRate
          : BillRate // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Technician with DiagnosticableTreeMixin implements _Technician {
  _$_Technician(
      {this.TechID = '',
      this.TravelRate = '',
      this.CustomerBillRate = '',
      this.BillRate = ''});

  factory _$_Technician.fromJson(Map<String, dynamic> json) =>
      _$$_TechnicianFromJson(json);

  @override
  @JsonKey()
  final dynamic TechID;
  @override
  @JsonKey()
  final dynamic TravelRate;
  @override
  @JsonKey()
  final dynamic CustomerBillRate;
  @override
  @JsonKey()
  final dynamic BillRate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Technician(TechID: $TechID, TravelRate: $TravelRate, CustomerBillRate: $CustomerBillRate, BillRate: $BillRate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Technician'))
      ..add(DiagnosticsProperty('TechID', TechID))
      ..add(DiagnosticsProperty('TravelRate', TravelRate))
      ..add(DiagnosticsProperty('CustomerBillRate', CustomerBillRate))
      ..add(DiagnosticsProperty('BillRate', BillRate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Technician &&
            const DeepCollectionEquality().equals(other.TechID, TechID) &&
            const DeepCollectionEquality()
                .equals(other.TravelRate, TravelRate) &&
            const DeepCollectionEquality()
                .equals(other.CustomerBillRate, CustomerBillRate) &&
            const DeepCollectionEquality().equals(other.BillRate, BillRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(TechID),
      const DeepCollectionEquality().hash(TravelRate),
      const DeepCollectionEquality().hash(CustomerBillRate),
      const DeepCollectionEquality().hash(BillRate));

  @JsonKey(ignore: true)
  @override
  _$$_TechnicianCopyWith<_$_Technician> get copyWith =>
      __$$_TechnicianCopyWithImpl<_$_Technician>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TechnicianToJson(this);
  }
}

abstract class _Technician implements Technician {
  factory _Technician(
      {final dynamic TechID,
      final dynamic TravelRate,
      final dynamic CustomerBillRate,
      final dynamic BillRate}) = _$_Technician;

  factory _Technician.fromJson(Map<String, dynamic> json) =
      _$_Technician.fromJson;

  @override
  dynamic get TechID => throw _privateConstructorUsedError;
  @override
  dynamic get TravelRate => throw _privateConstructorUsedError;
  @override
  dynamic get CustomerBillRate => throw _privateConstructorUsedError;
  @override
  dynamic get BillRate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TechnicianCopyWith<_$_Technician> get copyWith =>
      throw _privateConstructorUsedError;
}
