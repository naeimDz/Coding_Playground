import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:space_practice/mini_app_store/widgets/home/product_cart.dart';
import '../../mobx/product_store_mobx.dart';
import '../../screens/details_screen.dart';
import '../../utils/constants.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductStore itemStore = ProductStore();
    itemStore.fetchItems();
    print(itemStore.items);
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70.0),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                Observer(builder: (_) {
                  if (itemStore.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: itemStore.items.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          DetailsScreen.detailScreen,
                          arguments: itemStore.items[index],
                        );
                      },
                      child: ProductCard(
                        itemIndex: index,
                        product: itemStore.items[index],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
