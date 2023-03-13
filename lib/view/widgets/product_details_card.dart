import 'package:flutter/material.dart';

class ProductDetailsCard extends StatelessWidget {
  final String img;

  const ProductDetailsCard({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.19,
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            img,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
