
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {


  @observable
  List<String> produtos = [
    'maçã',
    'pêra',
    'banana',
    'abacaxi',
    'manga',
  ];

  @observable
  List<String> produtosExibidos = [];


  HomeStoreBase() {
    _init();
  }

  @action
  Future<void> _init() async {
    carregar();
  }

  Future<void> carregar() async {
    produtosExibidos = produtos;
  }

  void pesquisar(String pesquisa) {
    if (pesquisa != '')
      produtosExibidos = produtos.where((i) => i.contains(pesquisa)).toList();
    else
      carregar();
  }

  void adicionar(String produto) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? produtos = await prefs.getStringList('produtos') ;
    produtos = produtos == null ? [] : produtos;
    produtos.add(produto);
    prefs.setStringList('produtos', produtos);

  }
}
