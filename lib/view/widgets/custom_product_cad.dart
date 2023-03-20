import 'package:firebase_ecommerce/utils/routes.dart';
import 'package:flutter/material.dart';

class CustomProductCad extends StatelessWidget {
  final String img;
  final double price;
  final String title;
  const CustomProductCad(
      {Key? key, required this.img, required this.price, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productDetailsScreen);
      },
      child: Card(
        child: SizedBox(
          height: 250,
          width: 180,
          child: Column(
            children: <Widget>[
              Container(
                height: 190,
                width: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(img),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "\$ $price",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
