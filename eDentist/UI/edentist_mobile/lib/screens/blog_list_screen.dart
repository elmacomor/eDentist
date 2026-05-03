import 'package:edentist_mobile/models/blog_post.dart';
import 'package:edentist_mobile/models/user.dart';
import 'package:edentist_mobile/providers/blogpost_provider.dart';
import 'package:edentist_mobile/screens/blog_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogListPage extends StatefulWidget {
  const BlogListPage({Key? key}) : super(key: key);

  @override
  _BlogListPageState createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> {
  late BlogPostProvider _blogProvider;
  List<BlogPost> blogs = [];

  @override
  void initState() {
    super.initState();
    _blogProvider = Provider.of<BlogPostProvider>(context, listen: false);
    _fetchBlogs();
  }

  Future<void> _fetchBlogs() async {
    try {
      var fetchedBlogs = await _blogProvider.get();

      setState(() {
        blogs = fetchedBlogs.result;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogovi'),
      ),
      body: _buildBlogList(),
    );
  }

  Widget _buildBlogList() {
    if (blogs.isEmpty) {
      return Center(
        child: Text('Nema dostupnih blogova.'),
      );
    }

    return ListView.builder(
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        return _buildBlogCard(blogs[index]);
      },
    );
  }

  Widget _buildBlogCard(BlogPost blog) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Display Title
          ListTile(
            title: Text(blog.headline ?? " "),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogDetailsScreen(blog: blog),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
