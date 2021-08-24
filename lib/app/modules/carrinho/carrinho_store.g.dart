// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarrinhoStore on CarrinhoStoreBase, Store {
  final _$produtosExibidosAtom =
      Atom(name: 'CarrinhoStoreBase.produtosExibidos');

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

  final _$_initAsyncAction = AsyncAction('CarrinhoStoreBase._init');

  @override
  Future<void> _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  @override
  String toString() {
    return '''
produtosExibidos: ${produtosExibidos}
    ''';
  }
}
