import 'package:edentist_mobile/models/comment.dart';

import 'base_provider.dart';

class CommentProvider extends BaseProvider<Comment> {
  CommentProvider() : super("Comment");

  @override
  Comment fromJson(data) {
    return Comment.fromJson(data);
  }
}
