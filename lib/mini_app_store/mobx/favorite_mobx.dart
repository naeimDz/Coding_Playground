import 'package:mobx/mobx.dart';
import 'package:space_practice/mini_app_store/models/product.dart';

part 'favorite_mobx.g.dart';

class Favorite = _FavoriteBase with _$Favorite;

abstract class _FavoriteBase with Store {
  @observable
  ObservableList<Product> favoriteProducts = ObservableList<Product>();

  @action
  void addFavorite(Product pro) {
    favoriteProducts.add(pro);
  }

  @action
  void removeProduct(Product pro) {
    favoriteProducts.remove(pro);
  }

  @action
  bool checkFavoriteItem(int id) {
    return favoriteProducts.where((element) => element.id == id).isEmpty;
  }
}
