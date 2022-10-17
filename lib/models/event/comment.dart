import 'package:freezed_annotation/freezed_annotation.dart';
part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  factory Comment({
    @Default('') String CommentID,
    @Default('') String CommentType,
    @Default('') String CommentUser,
    @Default('') String UserName,
    @Default('') String CommentDate,
    @Default('') String CommentText,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}