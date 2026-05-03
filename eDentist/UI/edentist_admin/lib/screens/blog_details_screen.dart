import 'dart:convert';
import 'dart:io';

import 'package:eprodaja_admin/models/blog_post.dart';
import 'package:eprodaja_admin/models/search_result.dart';
import 'package:eprodaja_admin/providers/blog_post_provider.dart';
import 'package:eprodaja_admin/screens/blog_screen.dart';
import 'package:eprodaja_admin/widgets/master_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class BlogDetailsScreen extends StatefulWidget {
  BlogPost? post;
  BlogDetailsScreen({super.key, this.post});

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> _initialValue = {};

  late BlogPostProvider _blogProvider;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initialValue = {
      'headline': widget.post?.headline,
      'content': widget.post?.content,
    };

    _blogProvider = context.read<BlogPostProvider>();

    initForm();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future initForm() async {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MasterScreenWidget(
      child: Column(children: [
        isLoading ? Container() : _buildForm(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () async {
                    final isHeadlineValid =
                        _formKey.currentState!.fields['headline']?.validate();
                    final isContentValid =
                        _formKey.currentState!.fields['content']?.validate();

                    if (isHeadlineValid == null ||
                        !isHeadlineValid ||
                        isContentValid == null ||
                        !isContentValid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Potrebno je unijeti sva polja'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    if (_base64Image == null || _base64Image!.isEmpty) {
                      _base64Image = base64Encode(
                          File('assets/images/no-image.jpg').readAsBytesSync());
                    }
                    _formKey.currentState?.saveAndValidate();

                    print(_formKey.currentState?.value);

                    var request = new Map.from(_formKey.currentState!.value);
                    request['slika'] = _base64Image;

                    try {
                      if (widget.post == null) {
                        await _blogProvider.insert(request);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Blog je uspjesno dodan!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        _formKey.currentState?.reset();
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => BlogListPage(),
                          ),
                        );
                      } else {
                        print(request);
                        await _blogProvider.update(
                            widget.post!.blogId!, request);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Blog je uspješno uređen.'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => BlogListPage(),
                          ),
                        );
                      }
                    } on Exception catch (e) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: Text("Greška!"),
                                content: Text(e.toString()),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("OK"))
                                ],
                              ));
                    }
                  },
                  child: Text("Save")),
            )
          ],
        )
      ]),
      title: this.widget.post?.headline ?? "Dodaj novi blog",
    );
  }

  FormBuilder _buildForm() {
    return FormBuilder(
        key: _formKey,
        initialValue: _initialValue,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    decoration: InputDecoration(labelText: "Naslov bloga"),
                    name: 'headline',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Naslov je obavezan.';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: FormBuilderTextField(
                    decoration: InputDecoration(labelText: "Sadrzaj"),
                    name: 'content',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ne možete spasiti bez sadržaja!';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: FormBuilderField(
                  name: 'slika',
                  builder: ((field) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          label: Text('Select image'),
                          errorText: field.errorText),
                      child: ListTile(
                        leading: Icon(Icons.photo),
                        title: Text('Select image here'),
                        trailing: Icon(Icons.file_upload),
                        onTap: getImage,
                      ),
                    );
                  }),
                ))
              ],
            )
          ],
        ));
  }

  File? _image;
  String? _base64Image;

  Future getImage() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.single.path != null) {
      _image = File(result.files.single.path!);
      _base64Image = base64Encode(_image!.readAsBytesSync());
    } else {
      _base64Image =
          base64Encode(File('assets/no-image.jpg').readAsBytesSync());
    }
  }
}
