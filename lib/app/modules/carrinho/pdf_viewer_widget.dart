import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerWidget extends StatelessWidget {
  String pathPDF = "";

  PdfViewerWidget(this.pathPDF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF'),
      ),
      body: PDFView(
        filePath: pathPDF,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onRender: (_pages) {
        },
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          print(pdfViewController);
          //_controller.complete(pdfViewController);
        },
        onPageChanged: (page, total) {
          print('page change: $page/$total');
        },
      ),
    );
  }
}
