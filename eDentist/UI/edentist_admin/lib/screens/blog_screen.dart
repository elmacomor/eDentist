import 'package:flutter/material.dart';
import 'package:eprodaja_admin/models/blog_post.dart';
import 'package:eprodaja_admin/providers/blog_post_provider.dart';
import 'package:provider/provider.dart';
import 'blog_details_screen.dart';

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
        title: Text('Pregled blogova', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlogDetailsScreen(
                  post: null,
                ),
              ));
              _fetchBlogs();
            },
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Dodaj novi blog post',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: _buildBlogList(),
          ),
        ],
      ),
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
                  builder: (context) => BlogDetailsScreen(post: blog),
                ),
              );
            },
            // Add more widgets to display other blog details as needed
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmationDialog(blog);
            },
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BlogPost e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Potvrdi brisanje'),
          content: Text('Jeste li sigruni da zelite obrisati odabrani blog?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Otkazi'),
            ),
            TextButton(
              onPressed: () async {
                await _deleteBlog(e);
                Navigator.of(context).pop();
              },
              child: Text('Obrisi'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteBlog(BlogPost s) async {
    try {
      await _blogProvider.delete(s.blogId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Blog uspjesno obrisan.'),
          duration: Duration(seconds: 2),
        ),
      );
      _fetchBlogs();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Greska pri brisanju!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
