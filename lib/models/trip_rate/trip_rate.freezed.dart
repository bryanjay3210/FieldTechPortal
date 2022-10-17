// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trip_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TripRate _$TripRateFromJson(Map<String, dynamic> json) {
  return _TripRate.fromJson(json);
}

/// @nodoc
mixin _$TripRate {
  dynamic get Command => throw _privateConstructorUsedError;
  dynamic get Subcommand1 => throw _privateConstructorUsedError;
  dynamic get Miles => throw _privateConstructorUsedError;
  dynamic get TechRate => throw _privateConstructorUsedError;
  dynamic get TechRateType => throw _privateConstructorUsedError;
  dynamic get TotalCharge => throw _privateConstructorUsedError;
  dynamic get Status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripRateCopyWith<TripRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripRateCopyWith<$Res> {
  factory $TripRateCopyWith(TripRate value, $Res Function(TripRate) then) =
      _$TripRateCopyWithImpl<$Res>;
  $Res call(
      {dynamic Command,
      dynamic Subcommand1,
      dynamic Miles,
      dynamic TechRate,
      dynamic TechRateType,
      dynamic TotalCharge,
      dynamic Status});
}

/// @nodoc
class _$TripRateCopyWithImpl<$Res> implements $TripRateCopyWith<$Res> {
  _$TripRateCopyWithImpl(this._value, this._then);

  final TripRate _value;
  // ignore: unused_field
  final $Res Function(TripRate) _then;

  @override
  $Res call({
    Object? Command = freezed,
    Object? Subcommand1 = freezed,
    Object? Miles = freezed,
    Object? TechRate = freezed,
    Object? TechRateType = freezed,
    Object? TotalCharge = freezed,
    Object? Status = freezed,
  }) {
    return _then(_value.copyWith(
      Command: Command == freezed
          ? _value.Command
          : Command // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Subcommand1: Subcommand1 == freezed
          ? _value.Subcommand1
          : Subcommand1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Miles: Miles == freezed
          ? _value.Miles
          : Miles // ignore: cast_nullable_to_non_nullable
              as dynamic,
      TechRate: TechRate == freezed
          ? _value.TechRate
          : TechRate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      TechRateType: TechRateType == freezed
          ? _value.TechRateType
          : TechRateType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      TotalCharge: TotalCharge == freezed
          ? _value.TotalCharge
          : TotalCharge // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Status: Status == freezed
          ? _value.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_TripRateCopyWith<$Res> implements $TripRateCopyWith<$Res> {
  factory _$$_TripRateCopyWith(
          _$_TripRate value, $Res Function(_$_TripRate) then) =
      __$$_TripRateCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic Command,
      dynamic Subcommand1,
      dynamic Miles,
      dynamic TechRate,
      dynamic TechRateType,
      dynamic TotalCharge,
      dynamic Status});
}

/// @nodoc
class __$$_TripRateCopyWithImpl<$Res> extends _$TripRateCopyWithImpl<$Res>
    implements _$$_TripRateCopyWith<$Res> {
  __$$_TripRateCopyWithImpl(
      _$_TripRate _value, $Res Function(_$_TripRate) _then)
      : super(_value, (v) => _then(v as _$_TripRate));

  @override
  _$_TripRate get _value => super._value as _$_TripRate;

  @override
  $Res call({
    Object? Command = freezed,
    Object? Subcommand1 = freezed,
    Object? Miles = freezed,
    Object? TechRate = freezed,
    Object? TechRateType = freezed,
    Object? TotalCharge = freezed,
    Object? Status = freezed,
  }) {
    return _then(_$_TripRate(
      Command: Command == freezed
          ? _value.Command
          : Command // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Subcommand1: Subcommand1 == freezed
          ? _value.Subcommand1
          : Subcommand1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Miles: Miles == freezed
          ? _value.Miles
          : Miles // ignore: cast_nullable_to_non_nullable
              as dynamic,
      TechRate: TechRate == freezed
          ? _value.TechRate
          : TechRate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      TechRateType: TechRateType == freezed
          ? _value.TechRateType
          : TechRateType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      TotalCharge: TotalCharge == freezed
          ? _value.TotalCharge
          : TotalCharge // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Status: Status == freezed
          ? _value.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TripRate with DiagnosticableTreeMixin implements _TripRate {
  _$_TripRate(
      {this.Command = '',
      this.Subcommand1 = '',
      this.Miles = '',
      this.TechRate = '',
      this.TechRateType = '',
      this.TotalCharge = '',
      this.Status = ''});

  factory _$_TripRate.fromJson(Map<String, dynamic> json) =>
      _$$_TripRateFromJson(json);

  @override
  @JsonKey()
  final dynamic Command;
  @override
  @JsonKey()
  final dynamic Subcommand1;
  @override
  @JsonKey()
  final dynamic Miles;
  @override
  @JsonKey()
  final dynamic TechRate;
  @override
  @JsonKey()
  final dynamic TechRateType;
  @override
  @JsonKey()
  final dynamic TotalCharge;
  @override
  @JsonKey()
  final dynamic Status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TripRate(Command: $Command, Subcommand1: $Subcommand1, Miles: $Miles, TechRate: $TechRate, TechRateType: $TechRateType, TotalCharge: $TotalCharge, Status: $Status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TripRate'))
      ..add(DiagnosticsProperty('Command', Command))
      ..add(DiagnosticsProperty('Subcommand1', Subcommand1))
      ..add(DiagnosticsProperty('Miles', Miles))
      ..add(DiagnosticsProperty('TechRate', TechRate))
      ..add(DiagnosticsProperty('TechRateType', TechRateType))
      ..add(DiagnosticsProperty('TotalCharge', TotalCharge))
      ..add(DiagnosticsProperty('Status', Status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripRate &&
            const DeepCollectionEquality().equals(other.Command, Command) &&
            const DeepCollectionEquality()
                .equals(other.Subcommand1, Subcommand1) &&
            const DeepCollectionEquality().equals(other.Miles, Miles) &&
            const DeepCollectionEquality().equals(other.TechRate, TechRate) &&
            const DeepCollectionEquality()
                .equals(other.TechRateType, TechRateType) &&
            const DeepCollectionEquality()
                .equals(other.TotalCharge, TotalCharge) &&
            const DeepCollectionEquality().equals(other.Status, Status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(Command),
      const DeepCollectionEquality().hash(Subcommand1),
      const DeepCollectionEquality().hash(Miles),
      const DeepCollectionEquality().hash(TechRate),
      const DeepCollectionEquality().hash(TechRateType),
      const DeepCollectionEquality().hash(TotalCharge),
      const DeepCollectionEquality().hash(Status));

  @JsonKey(ignore: true)
  @override
  _$$_TripRateCopyWith<_$_TripRate> get copyWith =>
      __$$_TripRateCopyWithImpl<_$_TripRate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripRateToJson(this);
  }
}

abstract class _TripRate implements TripRate {
  factory _TripRate(
      {final dynamic Command,
      final dynamic Subcommand1,
      final dynamic Miles,
      final dynamic TechRate,
      final dynamic TechRateType,
      final dynamic TotalCharge,
      final dynamic Status}) = _$_TripRate;

  factory _TripRate.fromJson(Map<String, dynamic> json) = _$_TripRate.fromJson;

  @override
  dynamic get Command => throw _privateConstructorUsedError;
  @override
  dynamic get Subcommand1 => throw _privateConstructorUsedError;
  @override
  dynamic get Miles => throw _privateConstructorUsedError;
  @override
  dynamic get TechRate => throw _privateConstructorUsedError;
  @override
  dynamic get TechRateType => throw _privateConstructorUsedError;
  @override
  dynamic get TotalCharge => throw _privateConstructorUsedError;
  @override
  dynamic get Status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TripRateCopyWith<_$_TripRate> get copyWith =>
      throw _privateConstructorUsedError;
}
