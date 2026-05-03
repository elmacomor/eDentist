import 'package:edentist_mobile/models/comment.dart';
import 'package:edentist_mobile/models/search_result.dart';
import 'package:edentist_mobile/models/user.dart';
import 'package:edentist_mobile/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:edentist_mobile/models/blog_post.dart';
import 'package:edentist_mobile/providers/comment_provider.dart';
import 'package:edentist_mobile/utils/util.dart';
import 'package:provider/provider.dart';

class BlogDetailsScreen extends StatefulWidget {
  final BlogPost blog;

  const BlogDetailsScreen({Key? key, required this.blog}) : super(key: key);

  @override
  _BlogDetailsScreenState createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  final TextEditingController _commentController = TextEditingController();
  
  List<Comment> _comments = [];
  bool _showAllComments = false;
  late CommentProvider _commentProvider;
  late UserProvider _korisniciProvider;
  late User pacijent;

  @override
  void initState() {
    super.initState();
    _commentProvider = Provider.of<CommentProvider>(context, listen: false);
    _loadComments();
      _korisniciProvider = context.read<UserProvider>();
    this.getPatient();
  }

    void getPatient() async {
    final pacijenti = await _korisniciProvider.get();

    pacijent = pacijenti.result
        .firstWhere((korisnik) => korisnik.username == Authorization.username);
  }

  void _loadComments() async {
    SearchResult<Comment> comments = await _commentProvider.get();
    setState(() {
      _comments = comments.result.where((c) => c.blogId==widget.blog.blogId).toList();
    });
    print(_comments.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalji bloga'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.blog.headline ?? "",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            _buildBlogImage(),
            SizedBox(height: 16.0),
            Text(
              widget.blog.content ?? "",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            _buildCommentInput(),
            SizedBox(height: 16.0),
            _buildComments(),
            _buildLoadMoreButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBlogImage() {
    if (widget.blog.slika == null || widget.blog.slika == "0x" || widget.blog.slika == "") {
      return Container(
        height: 120,
        width: 120,
        color: Colors.grey,
        margin: EdgeInsets.all(16),
        child: Text("No image",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      );
    } else {
      return Container(
        height: 200,
        width: double.infinity,
        margin: EdgeInsets.all(16),
        child: imageFromBase64String(widget.blog.slika!),
      );
    }
  }

  Widget _buildCommentInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ostavite komentar:'),
        TextField(
          controller: _commentController,
          decoration: InputDecoration(
            hintText: 'Unesite svoj komentar',
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed:() {
              if (LoggedIn.isLoggedIn) {
                _postComment();
              } else {
                _showLoginDialog();
              }
            },
            ),
          ),
        ),
      ],
    );
  }

  void _postComment() {
    if (_commentController.text.isNotEmpty) {
      Comment newComment = Comment(0,
        pacijent.userId,
        DateTime.now(),
        widget.blog.blogId,
        _commentController.text,
      );
      _commentProvider.insert(newComment).then((_) {
        _commentController.clear();
        _loadComments();
        print("inserta comment");
        
      });
    }
  }
void _showLoginDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Log In Required'),
        content: Text('Molim vas logirajte se kako biste mogli ostaviti komentar.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
  Widget _buildComments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _showAllComments
          ? _comments.map((comment) => _buildCommentItem(comment)).toList()
          : _comments.take(3).map((comment) => _buildCommentItem(comment)).toList(),
    );
  }

  Widget _buildCommentItem(Comment comment) {
    return ListTile(
      title: Text(comment.content??""),
      subtitle: Text(comment.datum.toString()), // You can format the date as needed
      // Other comment details like user name can be added here
    );
  }

  Widget _buildLoadMoreButton() {
    return _comments.length > 3 && !_showAllComments
        ? TextButton(
            onPressed: () {
              setState(() {
                _showAllComments = true;
              });
            },
            child: Text('Ucitaj sve'),
          )
        : Container();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
