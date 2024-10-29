// controllers/Product_controller.dart

import '../api/api_service.dart';
import '../api/cache_service.dart';
import '../models/product.dart';

class ProductController {
  final ApiService _apiService = ApiService();
  final CacheService _cacheService = CacheService();

  Future<List<Product>> getItems() async {
    final cachedItems = _cacheService.getCachedItems();

    if (cachedItems != null) {
      return cachedItems;
    }

    final items = await _apiService.fetchProducts();
    print(items);

    _cacheService.cacheItems(items);
    return items;
  }
}
