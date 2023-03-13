import 'package:firebase_ecommerce/utils/routes.dart';
import 'package:firebase_ecommerce/view/screens/product_details/product_details_view_model.dart';
import 'package:firebase_ecommerce/view/widgets/custom_card_size.dart';
import 'package:firebase_ecommerce/view/widgets/product_details_card.dart';
import 'package:firebase_ecommerce/view/widgets/quantity_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetails = context.watch<ProductDetailsViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductDetailsCard(img: 'assets/images/man.jpg'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "T-chert Man",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "150 JOD",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
                "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Size",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: productDetails.size.length,
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ),
                  itemBuilder: (context, index) {
                    return CustomCardWidget(
                      text: productDetails.size[index],
                      color: Colors.grey[100]!,
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Color",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: productDetails.size.length,
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ),
                  itemBuilder: (context, index) {
                    return CustomCardWidget(
                      color: productDetails.color[index],
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              "Quantity",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            QuantityCard(
                q: productDetails.quantity,
                add: () {
                  productDetails.addQuantity();
                },
                remove: () {
                  productDetails.removeQuantity();
                }),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.cartScreen);
              },
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.redAccent,
                ),
                child: const Center(
                  child: Text(
                    "Check out",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
