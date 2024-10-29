import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../mobx/favorite_mobx.dart';
import '../../models/product.dart';
import '../../utils/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.itemIndex,
    required this.product,
  });
  final int itemIndex;
  final Product product;

  @override
  Widget build(BuildContext context) {
    Favorite favorite = Provider.of<Favorite>(context);
    bool check(int id) {
      return favorite.favoriteProducts
          .where((element) => element.id == id)
          .isEmpty;
    }

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 160.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 15),
                          blurRadius: 25,
                          color: Colors.black26),
                    ],
                  ),
                ),
                // image
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    height: 160.0,
                    width: 170.0,
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                // title + description+price
                Positioned(
                  top: 40.0,
                  right: 0.0,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          maxLines: 1,
                          overflow:
                              TextOverflow.ellipsis, // Add ellipsis at the end
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          product.category,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'السعر: ${product.price.toStringAsFixed(2)}\$', // Format price with 2 decimal places
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 15),
                      blurRadius: 25,
                      color: Colors.black26),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () => null,
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.green,
                  ),
                  IconButton(
                    onPressed: () => favorite.addFavorite(product),
                    icon: check(product.id)
                        ? Icon(Icons.favorite_outline)
                        : Icon(Icons.favorite),
                    color: Colors.red,
                  ),
                  IconButton(
                    onPressed: () {
                      products[4].price = 1703;
                    },
                    icon: Icon(Icons.send),
                    color: Colors.blue,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
