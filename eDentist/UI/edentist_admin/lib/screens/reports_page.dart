import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ReportsPage extends StatefulWidget {
  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  List<File> _reports = [];

  @override
  void initState() {
    super.initState();
    _loadReports();
  }

  Future<void> _loadReports() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/Reports';
    final dir = Directory(path);

    if (await dir.exists()) {
      setState(() {
        _reports = dir
            .listSync()
            .where((file) => file.path.endsWith('.pdf'))
            .map((file) => File(file.path))
            .toList();
      });
    }
  }

  Future<void> _openReport(File file) async {
    if (await file.exists()) {
      // Get the path of the file
      final directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}\\Reports';

      // Use Process.run to launch the default PDF viewer
      await Process.run('explorer.exe', [filePath]);
    } else {
      // File not found or doesn't exist
      print('File not found: ${file.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Reports'),
        backgroundColor: Colors.blue,
      ),
      body: _reports.isEmpty
          ? Center(child: Text('No reports available.'))
          : ListView.builder(
              itemCount: _reports.length,
              itemBuilder: (context, index) {
                final file = _reports[index];
                final fileName = file.path.split('/').last;
                return ListTile(
                  title: Text(fileName),
                  onTap: () => _openReport(file),
                );
              },
            ),
    );
  }
}
