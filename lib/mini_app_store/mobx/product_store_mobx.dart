import 'package:mobx/mobx.dart';
import '../controller/product_controller.dart';
import '../models/product.dart';

part 'product_store_mobx.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  final ProductController _controller = ProductController();

  @observable
  ObservableList<Product> items = ObservableList<Product>();

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchItems() async {
    isLoading = true;
    try {
      final fetchedItems = await _controller.getItems();
      items = ObservableList.of(fetchedItems);
    } catch (e) {
      // Handle error appropriately
    } finally {
      isLoading = false;
    }
  }
}
