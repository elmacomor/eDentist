import 'package:eprodaja_admin/models/blog_post.dart';

import 'base_provider.dart';

class BlogPostProvider extends BaseProvider<BlogPost> {
  BlogPostProvider() : super("BlogPost");

  @override
  BlogPost fromJson(data) {
    return BlogPost.fromJson(data);
  }
}
