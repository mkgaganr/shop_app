import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:partner_flutter_app/state/pdf_view_state.dart';
import 'package:partner_flutter_app/widgets/add_drower.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class PdfViewerScreen extends StatefulWidget {
  static const routeName = '/pdf-screens';

  @override
  _PdfView createState() => _PdfView();
}

class _PdfView extends State<PdfViewerScreen> {
  String localPath;
  LocalStorage storage = new LocalStorage('usertoken');

  @override
  Widget build(BuildContext context) {
    var token = storage.getItem('token');
    final id = ModalRoute.of(context).settings.arguments;
    ApiServiceProvider.loadPDF(id, token).then((value) {
      setState(() {
        localPath = value;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PDF Viewer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: localPath != null
          ? PDFView(
              filePath: localPath,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
