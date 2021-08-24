import 'package:feira/app/modules/carrinho/carrinho_store.dart';
import 'package:feira/app/modules/carrinho/carrinho_store.dart';
import 'package:feira/app/modules/carrinho/carrinho_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CarrinhoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CarrinhoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => CarrinhoPage()),
  ];
}
