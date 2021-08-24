import 'package:feira/app/modules/carrinho/carrinho_module.dart';
import 'package:feira/app/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/carrinho', module: CarrinhoModule()),
  ];
}
