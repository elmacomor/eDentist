// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      (json['commentID'] as num?)?.toInt(),
      (json['userId'] as num?)?.toInt(),
      json['datum'] == null ? null : DateTime.parse(json['datum'] as String),
      (json['blogId'] as num?)?.toInt(),
      json['content'] as String?,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'commentID': instance.commentID,
      'userId': instance.userId,
      'datum': instance.datum?.toIso8601String(),
      'blogId': instance.blogId,
      'content': instance.content,
    };
