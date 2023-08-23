import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:space_practice/constants.dart';
import 'package:space_practice/mobx/favorite_mobx.dart';
import 'package:space_practice/models/product.dart';

class FavoritesTab extends StatelessWidget {
    static const String favoriteScreen = '/favorite';
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    Favorite favorite = Provider.of<Favorite>(context);
    List<Product> listFavorite = favorite.favoriteProducts;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
            margin: const EdgeInsets.only(top: 30.0),
            decoration: const BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Observer(
              builder: (context) {
                return ListView.builder(
                  itemCount: listFavorite.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      height: 100,
                      width: size.width,
                      child: Stack(children: [
                        Container(
                          width: 100,
                          decoration: const BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(90),
                                bottomRight: Radius.circular(50),
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(64)),
                          ),
                          child: Image.asset(
                            listFavorite[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: size.width / 4,
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: size.width / 2,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(listFavorite[index].title),
                                Text("\$${listFavorite[index].price}"),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: size.width - (size.width / 4),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            height: 100,
                            child: Center(
                              child: IconButton(
                                  onPressed: () => favorite
                                      .removeProduct(listFavorite[index]),
                                  icon: Icon(Icons.favorite)),
                            ),
                          ),
                        ),
                      ]),
                    );
                  },
                );
              },
            )));
  }
}
