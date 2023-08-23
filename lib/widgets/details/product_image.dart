import 'package:flutter/material.dart';

import '../../constants.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    this.size,
    required this.image,
  });

  final Size? size;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      height: size!.width * 0.8 ?? 360,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size!.width * 0.7 ?? 340,
            width: size!.width * 0.7 ?? 340,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Image.asset(
            image,
            height: size!.width * 0.75 ?? 50,
            width: size!.width * 0.75 ?? 80,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
