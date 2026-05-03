import 'package:json_annotation/json_annotation.dart';

part "comment.g.dart";

@JsonSerializable()
class Comment {
  int? commentID;
  int? userId;
  DateTime? datum;
  int? blogId;
  String? content;

  Comment(this.commentID, this.userId, this.datum,
      this.blogId,this.content);

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
