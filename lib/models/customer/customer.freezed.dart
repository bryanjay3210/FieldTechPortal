// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  dynamic get Name => throw _privateConstructorUsedError;
  dynamic get PhoneHome => throw _privateConstructorUsedError;
  dynamic get PhoneWork => throw _privateConstructorUsedError;
  dynamic get PhoneCell => throw _privateConstructorUsedError;
  dynamic get Address => throw _privateConstructorUsedError;
  dynamic get BuildingName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res>;
  $Res call(
      {dynamic Name,
      dynamic PhoneHome,
      dynamic PhoneWork,
      dynamic PhoneCell,
      dynamic Address,
      dynamic BuildingName});
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res> implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  final Customer _value;
  // ignore: unused_field
  final $Res Function(Customer) _then;

  @override
  $Res call({
    Object? Name = freezed,
    Object? PhoneHome = freezed,
    Object? PhoneWork = freezed,
    Object? PhoneCell = freezed,
    Object? Address = freezed,
    Object? BuildingName = freezed,
  }) {
    return _then(_value.copyWith(
      Name: Name == freezed
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PhoneHome: PhoneHome == freezed
          ? _value.PhoneHome
          : PhoneHome // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PhoneWork: PhoneWork == freezed
          ? _value.PhoneWork
          : PhoneWork // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PhoneCell: PhoneCell == freezed
          ? _value.PhoneCell
          : PhoneCell // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Address: Address == freezed
          ? _value.Address
          : Address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      BuildingName: BuildingName == freezed
          ? _value.BuildingName
          : BuildingName // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_CustomerCopyWith<$Res> implements $CustomerCopyWith<$Res> {
  factory _$$_CustomerCopyWith(
          _$_Customer value, $Res Function(_$_Customer) then) =
      __$$_CustomerCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic Name,
      dynamic PhoneHome,
      dynamic PhoneWork,
      dynamic PhoneCell,
      dynamic Address,
      dynamic BuildingName});
}

/// @nodoc
class __$$_CustomerCopyWithImpl<$Res> extends _$CustomerCopyWithImpl<$Res>
    implements _$$_CustomerCopyWith<$Res> {
  __$$_CustomerCopyWithImpl(
      _$_Customer _value, $Res Function(_$_Customer) _then)
      : super(_value, (v) => _then(v as _$_Customer));

  @override
  _$_Customer get _value => super._value as _$_Customer;

  @override
  $Res call({
    Object? Name = freezed,
    Object? PhoneHome = freezed,
    Object? PhoneWork = freezed,
    Object? PhoneCell = freezed,
    Object? Address = freezed,
    Object? BuildingName = freezed,
  }) {
    return _then(_$_Customer(
      Name: Name == freezed
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PhoneHome: PhoneHome == freezed
          ? _value.PhoneHome
          : PhoneHome // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PhoneWork: PhoneWork == freezed
          ? _value.PhoneWork
          : PhoneWork // ignore: cast_nullable_to_non_nullable
              as dynamic,
      PhoneCell: PhoneCell == freezed
          ? _value.PhoneCell
          : PhoneCell // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Address: Address == freezed
          ? _value.Address
          : Address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      BuildingName: BuildingName == freezed
          ? _value.BuildingName
          : BuildingName // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Customer with DiagnosticableTreeMixin implements _Customer {
  _$_Customer(
      {this.Name = '',
      this.PhoneHome = '',
      this.PhoneWork = '',
      this.PhoneCell = '',
      this.Address = '',
      this.BuildingName = ''});

  factory _$_Customer.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerFromJson(json);

  @override
  @JsonKey()
  final dynamic Name;
  @override
  @JsonKey()
  final dynamic PhoneHome;
  @override
  @JsonKey()
  final dynamic PhoneWork;
  @override
  @JsonKey()
  final dynamic PhoneCell;
  @override
  @JsonKey()
  final dynamic Address;
  @override
  @JsonKey()
  final dynamic BuildingName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Customer(Name: $Name, PhoneHome: $PhoneHome, PhoneWork: $PhoneWork, PhoneCell: $PhoneCell, Address: $Address, BuildingName: $BuildingName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Customer'))
      ..add(DiagnosticsProperty('Name', Name))
      ..add(DiagnosticsProperty('PhoneHome', PhoneHome))
      ..add(DiagnosticsProperty('PhoneWork', PhoneWork))
      ..add(DiagnosticsProperty('PhoneCell', PhoneCell))
      ..add(DiagnosticsProperty('Address', Address))
      ..add(DiagnosticsProperty('BuildingName', BuildingName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Customer &&
            const DeepCollectionEquality().equals(other.Name, Name) &&
            const DeepCollectionEquality().equals(other.PhoneHome, PhoneHome) &&
            const DeepCollectionEquality().equals(other.PhoneWork, PhoneWork) &&
            const DeepCollectionEquality().equals(other.PhoneCell, PhoneCell) &&
            const DeepCollectionEquality().equals(other.Address, Address) &&
            const DeepCollectionEquality()
                .equals(other.BuildingName, BuildingName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(Name),
      const DeepCollectionEquality().hash(PhoneHome),
      const DeepCollectionEquality().hash(PhoneWork),
      const DeepCollectionEquality().hash(PhoneCell),
      const DeepCollectionEquality().hash(Address),
      const DeepCollectionEquality().hash(BuildingName));

  @JsonKey(ignore: true)
  @override
  _$$_CustomerCopyWith<_$_Customer> get copyWith =>
      __$$_CustomerCopyWithImpl<_$_Customer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerToJson(this);
  }
}

abstract class _Customer implements Customer {
  factory _Customer(
      {final dynamic Name,
      final dynamic PhoneHome,
      final dynamic PhoneWork,
      final dynamic PhoneCell,
      final dynamic Address,
      final dynamic BuildingName}) = _$_Customer;

  factory _Customer.fromJson(Map<String, dynamic> json) = _$_Customer.fromJson;

  @override
  dynamic get Name => throw _privateConstructorUsedError;
  @override
  dynamic get PhoneHome => throw _privateConstructorUsedError;
  @override
  dynamic get PhoneWork => throw _privateConstructorUsedError;
  @override
  dynamic get PhoneCell => throw _privateConstructorUsedError;
  @override
  dynamic get Address => throw _privateConstructorUsedError;
  @override
  dynamic get BuildingName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerCopyWith<_$_Customer> get copyWith =>
      throw _privateConstructorUsedError;
}
