// api/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  static const String _baseUrl = 'https://fakestoreapi.com/products/';

  factory ApiService() {
    return _instance;
  }

  ApiService._internal(); // Private constructor for Singleton

  Future<List<Product>> fetchBooks() async {
    final response = await http.get(Uri.parse('$_baseUrl/books'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
