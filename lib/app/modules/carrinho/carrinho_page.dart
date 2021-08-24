import 'package:feira/app/modules/carrinho/carrinho_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CarrinhoPage extends StatefulWidget {
  final String title;

  const CarrinhoPage({Key? key, this.title = 'Carrinho'}) : super(key: key);

  @override
  CarrinhoPageState createState() => CarrinhoPageState();
}

class CarrinhoPageState extends ModularState<CarrinhoPage, CarrinhoStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: store.produtosExibidos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(store.produtosExibidos[index]),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.gerarPdf(context);
        },
        child: Icon(Icons.picture_as_pdf),
      ),
    );
  }
}
