import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {


  @action
  void autenticar(String usuario, String senha) {
    Modular.to.pushReplacementNamed('/home', );
  }
}