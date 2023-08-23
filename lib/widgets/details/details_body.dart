import 'package:flutter/material.dart';
import 'package:space_practice/widgets/details/product_image.dart';
import '../../constants.dart';
import '../../models/product.dart';

class DetailsBody extends StatelessWidget {
  final Product product;

  const DetailsBody({required this.product});

  @override
  Widget build(BuildContext context) {
    // to provide us the height and the width of the sceen
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
            decoration: const BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ProductImage(
                    size: size,
                    image: product.image,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: Text(
                    product.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(
                  'السعر: \$${product.price}',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: kSecondaryColor,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Implement your buy action logic here
                        },
                        icon: Icon(Icons.shopping_cart),
                        color: Colors.green,
                      ),
                      IconButton(
                        onPressed: () {
                          // Implement your favorite action logic here
                        },
                        icon: Icon(Icons.favorite_outline),
                        color: Colors.red,
                      ),
                      IconButton(
                        onPressed: () {
                          // Implement your send action logic here
                        },
                        icon: Icon(Icons.send),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical: kDefaultPadding / 2,
            ),
            child: Text(
              product.description,
              style: TextStyle(color: Colors.white, fontSize: 19.0),
            ),
          ),
        ],
      ),
    );
  }
}
