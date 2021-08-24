import 'package:feira/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: store.pesquisar,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search), )],
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: store.produtosExibidos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(store.produtosExibidos[index]),
              subtitle: Text('Clique para adicionar'),
              onTap: () {
                showAdicionar(context, store.produtosExibidos[index]);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamedAndRemoveUntil('/carrinho', (_) => false);
        },
        child: Icon(Icons.shopping_cart_outlined),
      ),
    );
  }

  showAdicionar(BuildContext context, String produto) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(produto),
          content: Text("Deseja adicionar este produto no carrinho?"),
          actions: [
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Sim"),
              onPressed: () {
                store.adicionar(produto);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
