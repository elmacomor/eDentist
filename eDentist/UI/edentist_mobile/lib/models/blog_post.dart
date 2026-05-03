import 'package:json_annotation/json_annotation.dart';

part 'blog_post.g.dart';

@JsonSerializable()
class BlogPost {
  int blogId;
  String? headline;
  String? content;
  String? slika;
  DateTime createdAt;

  BlogPost(
      this.blogId, this.headline, this.content, this.slika, this.createdAt);

  factory BlogPost.fromJson(Map<String, dynamic> json) =>
      _$BlogPostFromJson(json);

  Map<String, dynamic> toJson() => _$BlogPostToJson(this);
}
