import 'dart:io';

import 'package:feira/app/modules/carrinho/pdf_viewer_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

part 'carrinho_store.g.dart';

class CarrinhoStore = CarrinhoStoreBase with _$CarrinhoStore;

abstract class CarrinhoStoreBase with Store {
  @observable
  List<String> produtosExibidos = [];

  CarrinhoStoreBase() {
    _init();
  }

  @action
  Future<void> _init() async {
    carregar();
  }

  void carregar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    produtosExibidos = (await prefs.getStringList('produtos'))!;
  }

  void gerarPdf(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            child: pw.Center(
              child: pw.ListView.builder(
                itemCount: produtosExibidos.length,
                itemBuilder: (context, index) {
                  return pw.Text(produtosExibidos[index]);
                },
              ),
            ),
          ); // Center
        })); //

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/report.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PdfViewerWidget(path)),
    );
  }
}
