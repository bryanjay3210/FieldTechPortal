// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  String get CommentID => throw _privateConstructorUsedError;
  String get CommentType => throw _privateConstructorUsedError;
  String get CommentUser => throw _privateConstructorUsedError;
  String get UserName => throw _privateConstructorUsedError;
  String get CommentDate => throw _privateConstructorUsedError;
  String get CommentText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call(
      {String CommentID,
      String CommentType,
      String CommentUser,
      String UserName,
      String CommentDate,
      String CommentText});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object? CommentID = freezed,
    Object? CommentType = freezed,
    Object? CommentUser = freezed,
    Object? UserName = freezed,
    Object? CommentDate = freezed,
    Object? CommentText = freezed,
  }) {
    return _then(_value.copyWith(
      CommentID: CommentID == freezed
          ? _value.CommentID
          : CommentID // ignore: cast_nullable_to_non_nullable
              as String,
      CommentType: CommentType == freezed
          ? _value.CommentType
          : CommentType // ignore: cast_nullable_to_non_nullable
              as String,
      CommentUser: CommentUser == freezed
          ? _value.CommentUser
          : CommentUser // ignore: cast_nullable_to_non_nullable
              as String,
      UserName: UserName == freezed
          ? _value.UserName
          : UserName // ignore: cast_nullable_to_non_nullable
              as String,
      CommentDate: CommentDate == freezed
          ? _value.CommentDate
          : CommentDate // ignore: cast_nullable_to_non_nullable
              as String,
      CommentText: CommentText == freezed
          ? _value.CommentText
          : CommentText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String CommentID,
      String CommentType,
      String CommentUser,
      String UserName,
      String CommentDate,
      String CommentText});
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, (v) => _then(v as _$_Comment));

  @override
  _$_Comment get _value => super._value as _$_Comment;

  @override
  $Res call({
    Object? CommentID = freezed,
    Object? CommentType = freezed,
    Object? CommentUser = freezed,
    Object? UserName = freezed,
    Object? CommentDate = freezed,
    Object? CommentText = freezed,
  }) {
    return _then(_$_Comment(
      CommentID: CommentID == freezed
          ? _value.CommentID
          : CommentID // ignore: cast_nullable_to_non_nullable
              as String,
      CommentType: CommentType == freezed
          ? _value.CommentType
          : CommentType // ignore: cast_nullable_to_non_nullable
              as String,
      CommentUser: CommentUser == freezed
          ? _value.CommentUser
          : CommentUser // ignore: cast_nullable_to_non_nullable
              as String,
      UserName: UserName == freezed
          ? _value.UserName
          : UserName // ignore: cast_nullable_to_non_nullable
              as String,
      CommentDate: CommentDate == freezed
          ? _value.CommentDate
          : CommentDate // ignore: cast_nullable_to_non_nullable
              as String,
      CommentText: CommentText == freezed
          ? _value.CommentText
          : CommentText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment implements _Comment {
  _$_Comment(
      {this.CommentID = '',
      this.CommentType = '',
      this.CommentUser = '',
      this.UserName = '',
      this.CommentDate = '',
      this.CommentText = ''});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$$_CommentFromJson(json);

  @override
  @JsonKey()
  final String CommentID;
  @override
  @JsonKey()
  final String CommentType;
  @override
  @JsonKey()
  final String CommentUser;
  @override
  @JsonKey()
  final String UserName;
  @override
  @JsonKey()
  final String CommentDate;
  @override
  @JsonKey()
  final String CommentText;

  @override
  String toString() {
    return 'Comment(CommentID: $CommentID, CommentType: $CommentType, CommentUser: $CommentUser, UserName: $UserName, CommentDate: $CommentDate, CommentText: $CommentText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comment &&
            const DeepCollectionEquality().equals(other.CommentID, CommentID) &&
            const DeepCollectionEquality()
                .equals(other.CommentType, CommentType) &&
            const DeepCollectionEquality()
                .equals(other.CommentUser, CommentUser) &&
            const DeepCollectionEquality().equals(other.UserName, UserName) &&
            const DeepCollectionEquality()
                .equals(other.CommentDate, CommentDate) &&
            const DeepCollectionEquality()
                .equals(other.CommentText, CommentText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(CommentID),
      const DeepCollectionEquality().hash(CommentType),
      const DeepCollectionEquality().hash(CommentUser),
      const DeepCollectionEquality().hash(UserName),
      const DeepCollectionEquality().hash(CommentDate),
      const DeepCollectionEquality().hash(CommentText));

  @JsonKey(ignore: true)
  @override
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentToJson(this);
  }
}

abstract class _Comment implements Comment {
  factory _Comment(
      {final String CommentID,
      final String CommentType,
      final String CommentUser,
      final String UserName,
      final String CommentDate,
      final String CommentText}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  String get CommentID => throw _privateConstructorUsedError;
  @override
  String get CommentType => throw _privateConstructorUsedError;
  @override
  String get CommentUser => throw _privateConstructorUsedError;
  @override
  String get UserName => throw _privateConstructorUsedError;
  @override
  String get CommentDate => throw _privateConstructorUsedError;
  @override
  String get CommentText => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
