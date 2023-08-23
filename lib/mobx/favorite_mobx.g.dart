// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Favorite on _FavoriteBase, Store {
  late final _$favoriteProductsAtom =
      Atom(name: '_FavoriteBase.favoriteProducts', context: context);

  @override
  ObservableList<Product> get favoriteProducts {
    _$favoriteProductsAtom.reportRead();
    return super.favoriteProducts;
  }

  @override
  set favoriteProducts(ObservableList<Product> value) {
    _$favoriteProductsAtom.reportWrite(value, super.favoriteProducts, () {
      super.favoriteProducts = value;
    });
  }

  late final _$_FavoriteBaseActionController =
      ActionController(name: '_FavoriteBase', context: context);

  @override
  void addFavorite(Product pro) {
    final _$actionInfo = _$_FavoriteBaseActionController.startAction(
        name: '_FavoriteBase.addFavorite');
    try {
      return super.addFavorite(pro);
    } finally {
      _$_FavoriteBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(Product pro) {
    final _$actionInfo = _$_FavoriteBaseActionController.startAction(
        name: '_FavoriteBase.removeProduct');
    try {
      return super.removeProduct(pro);
    } finally {
      _$_FavoriteBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool checkFavoriteItem(int id) {
    final _$actionInfo = _$_FavoriteBaseActionController.startAction(
        name: '_FavoriteBase.checkFavoriteItem');
    try {
      return super.checkFavoriteItem(id);
    } finally {
      _$_FavoriteBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoriteProducts: ${favoriteProducts}
    ''';
  }
}
