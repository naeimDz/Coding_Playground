import 'package:space_practice/mini_app_store/models/product.dart';

class CacheService {
  // Singleton instance
  static final CacheService _instance = CacheService._internal();
  factory CacheService() => _instance;
  CacheService._internal();

  List<Product>? _cache;
  DateTime? _cacheTimestamp;
  final Duration cacheDuration = Duration(minutes: 10);

  List<Product>? getCachedItems() {
    if (_cache != null &&
        _cacheTimestamp != null &&
        DateTime.now().difference(_cacheTimestamp!) < cacheDuration) {
      return _cache;
    }
    return null;
  }

  void cacheItems(List<Product> items) {
    _cache = items;
    _cacheTimestamp = DateTime.now();
  }
}
