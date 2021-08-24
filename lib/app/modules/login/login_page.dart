import 'package:feira/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key? key, this.title = 'Login'}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usuarioCtrl = TextEditingController();
  TextEditingController senhaCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2,
            vertical: MediaQuery.of(context).size.height * 0.2,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Usuário',
                  textAlign: TextAlign.left,
                ),
                TextFormField(
                  controller: usuarioCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo vazio';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Senha'),
                TextFormField(
                    controller: senhaCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo vazio';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            store.autenticar(usuarioCtrl.value.text, senhaCtrl.value.text);
                          }
                        },
                        child: Text('Entrar')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
