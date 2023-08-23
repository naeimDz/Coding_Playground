import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../mobx/favorite_mobx.dart';
import '../../models/product.dart';

class SettingsTab extends StatelessWidget {
    static const String settingsScreen = '/settings';
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    Favorite favorite = Provider.of<Favorite>(context);
    return Observer(
      builder: (context) {
        return Container(
          color: Colors.green,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => favorite.addFavorite(products[3]),
                  child: Text("data")),
              ElevatedButton(
                  onPressed: () => favorite.checkFavoriteItem(products[3].id),
                  child: favorite.checkFavoriteItem(products[3].id)
                      ? Text("data")
                      : Text("pressed")),
              ListTile(
                title: Text(favorite.favoriteProducts.first.title),
              )
            ],
          ),
        );
      },
    );
  }
}
