// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogPost _$BlogPostFromJson(Map<String, dynamic> json) => BlogPost(
      (json['blogId'] as num).toInt(),
      json['headline'] as String?,
      json['content'] as String?,
      json['slika'] as String?,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$BlogPostToJson(BlogPost instance) => <String, dynamic>{
      'blogId': instance.blogId,
      'headline': instance.headline,
      'content': instance.content,
      'slika': instance.slika,
      'createdAt': instance.createdAt.toIso8601String(),
    };
