import 'package:flutter/material.dart';
import 'package:space_practice/screens/details_screen.dart';
import 'package:space_practice/screens/favorite_screen/favorite.dart';
import 'package:space_practice/screens/home_screen.dart';
import 'package:space_practice/screens/settings_screen/settings.dart';
import '../models/product.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.homeScreen:
        return _buildRoute(const HomeScreen());
      case DetailsScreen.detailScreen:
        final Product product = settings.arguments as Product;
        return _buildRoute(DetailsScreen(product: product));
      case FavoritesTab.favoriteScreen:
        return _buildRoute(const FavoritesTab());
      case SettingsTab.settingsScreen:
        return _buildRoute(const SettingsTab());
      default:
        return _buildRoute(const HomeScreen());
    }
  }

  static MaterialPageRoute _buildRoute(Widget builder) {
    return MaterialPageRoute(builder: (_) => builder);
  }
}
