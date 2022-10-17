// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String get EventID => throw _privateConstructorUsedError;
  String get TicketID => throw _privateConstructorUsedError;
  String get Name => throw _privateConstructorUsedError;
  String get EventStart => throw _privateConstructorUsedError;
  String get EventEnd => throw _privateConstructorUsedError;
  String get EventStatus => throw _privateConstructorUsedError;
  dynamic get Comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {String EventID,
      String TicketID,
      String Name,
      String EventStart,
      String EventEnd,
      String EventStatus,
      dynamic Comment});
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? EventID = freezed,
    Object? TicketID = freezed,
    Object? Name = freezed,
    Object? EventStart = freezed,
    Object? EventEnd = freezed,
    Object? EventStatus = freezed,
    Object? Comment = freezed,
  }) {
    return _then(_value.copyWith(
      EventID: EventID == freezed
          ? _value.EventID
          : EventID // ignore: cast_nullable_to_non_nullable
              as String,
      TicketID: TicketID == freezed
          ? _value.TicketID
          : TicketID // ignore: cast_nullable_to_non_nullable
              as String,
      Name: Name == freezed
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      EventStart: EventStart == freezed
          ? _value.EventStart
          : EventStart // ignore: cast_nullable_to_non_nullable
              as String,
      EventEnd: EventEnd == freezed
          ? _value.EventEnd
          : EventEnd // ignore: cast_nullable_to_non_nullable
              as String,
      EventStatus: EventStatus == freezed
          ? _value.EventStatus
          : EventStatus // ignore: cast_nullable_to_non_nullable
              as String,
      Comment: Comment == freezed
          ? _value.Comment
          : Comment // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {String EventID,
      String TicketID,
      String Name,
      String EventStart,
      String EventEnd,
      String EventStatus,
      dynamic Comment});
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, (v) => _then(v as _$_Event));

  @override
  _$_Event get _value => super._value as _$_Event;

  @override
  $Res call({
    Object? EventID = freezed,
    Object? TicketID = freezed,
    Object? Name = freezed,
    Object? EventStart = freezed,
    Object? EventEnd = freezed,
    Object? EventStatus = freezed,
    Object? Comment = freezed,
  }) {
    return _then(_$_Event(
      EventID: EventID == freezed
          ? _value.EventID
          : EventID // ignore: cast_nullable_to_non_nullable
              as String,
      TicketID: TicketID == freezed
          ? _value.TicketID
          : TicketID // ignore: cast_nullable_to_non_nullable
              as String,
      Name: Name == freezed
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      EventStart: EventStart == freezed
          ? _value.EventStart
          : EventStart // ignore: cast_nullable_to_non_nullable
              as String,
      EventEnd: EventEnd == freezed
          ? _value.EventEnd
          : EventEnd // ignore: cast_nullable_to_non_nullable
              as String,
      EventStatus: EventStatus == freezed
          ? _value.EventStatus
          : EventStatus // ignore: cast_nullable_to_non_nullable
              as String,
      Comment: Comment == freezed
          ? _value.Comment
          : Comment // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event implements _Event {
  _$_Event(
      {this.EventID = '',
      this.TicketID = '',
      this.Name = '',
      this.EventStart = '',
      this.EventEnd = '',
      this.EventStatus = '',
      this.Comment = ''});

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  @JsonKey()
  final String EventID;
  @override
  @JsonKey()
  final String TicketID;
  @override
  @JsonKey()
  final String Name;
  @override
  @JsonKey()
  final String EventStart;
  @override
  @JsonKey()
  final String EventEnd;
  @override
  @JsonKey()
  final String EventStatus;
  @override
  @JsonKey()
  final dynamic Comment;

  @override
  String toString() {
    return 'Event(EventID: $EventID, TicketID: $TicketID, Name: $Name, EventStart: $EventStart, EventEnd: $EventEnd, EventStatus: $EventStatus, Comment: $Comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            const DeepCollectionEquality().equals(other.EventID, EventID) &&
            const DeepCollectionEquality().equals(other.TicketID, TicketID) &&
            const DeepCollectionEquality().equals(other.Name, Name) &&
            const DeepCollectionEquality()
                .equals(other.EventStart, EventStart) &&
            const DeepCollectionEquality().equals(other.EventEnd, EventEnd) &&
            const DeepCollectionEquality()
                .equals(other.EventStatus, EventStatus) &&
            const DeepCollectionEquality().equals(other.Comment, Comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(EventID),
      const DeepCollectionEquality().hash(TicketID),
      const DeepCollectionEquality().hash(Name),
      const DeepCollectionEquality().hash(EventStart),
      const DeepCollectionEquality().hash(EventEnd),
      const DeepCollectionEquality().hash(EventStatus),
      const DeepCollectionEquality().hash(Comment));

  @JsonKey(ignore: true)
  @override
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(this);
  }
}

abstract class _Event implements Event {
  factory _Event(
      {final String EventID,
      final String TicketID,
      final String Name,
      final String EventStart,
      final String EventEnd,
      final String EventStatus,
      final dynamic Comment}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String get EventID => throw _privateConstructorUsedError;
  @override
  String get TicketID => throw _privateConstructorUsedError;
  @override
  String get Name => throw _privateConstructorUsedError;
  @override
  String get EventStart => throw _privateConstructorUsedError;
  @override
  String get EventEnd => throw _privateConstructorUsedError;
  @override
  String get EventStatus => throw _privateConstructorUsedError;
  @override
  dynamic get Comment => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}
