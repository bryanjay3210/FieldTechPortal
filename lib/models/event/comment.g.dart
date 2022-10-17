// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      CommentID: json['CommentID'] as String? ?? '',
      CommentType: json['CommentType'] as String? ?? '',
      CommentUser: json['CommentUser'] as String? ?? '',
      UserName: json['UserName'] as String? ?? '',
      CommentDate: json['CommentDate'] as String? ?? '',
      CommentText: json['CommentText'] as String? ?? '',
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'CommentID': instance.CommentID,
      'CommentType': instance.CommentType,
      'CommentUser': instance.CommentUser,
      'UserName': instance.UserName,
      'CommentDate': instance.CommentDate,
      'CommentText': instance.CommentText,
    };
