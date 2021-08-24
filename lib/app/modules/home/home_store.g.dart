// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$produtosAtom = Atom(name: 'HomeStoreBase.produtos');

  @override
  List<String> get produtos {
    _$produtosAtom.reportRead();
    return super.produtos;
  }

  @override
  set produtos(List<String> value) {
    _$produtosAtom.reportWrite(value, super.produtos, () {
      super.produtos = value;
    });
  }

  final _$produtosExibidosAtom = Atom(name: 'HomeStoreBase.produtosExibidos');

  @override
  List<String> get produtosExibidos {
    _$produtosExibidosAtom.reportRead();
    return super.produtosExibidos;
  }

  @override
  set produtosExibidos(List<String> value) {
    _$produtosExibidosAtom.reportWrite(value, super.produtosExibidos, () {
      super.produtosExibidos = value;
    });
  }

  final _$_initAsyncAction = AsyncAction('HomeStoreBase._init');

  @override
  Future<void> _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  @override
  String toString() {
    return '''
produtos: ${produtos},
produtosExibidos: ${produtosExibidos}
    ''';
  }
}
