import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ecommerce/utils/routes.dart';
import 'package:firebase_ecommerce/view/screens/home/home_view_model.dart';
import 'package:firebase_ecommerce/view/screens/list_product/list_product_screen.dart';
import 'package:firebase_ecommerce/view/widgets/custom_product_cad.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final home = context.watch<HomeViewModel>();

    return Scaffold(
        key: home.scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text(
            "HomeScreen",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          leading: IconButton(
              onPressed: () {
                home.scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  color: Colors.black,
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 120,
                //   width: double.infinity,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       // TextFormField(
                //       //   decoration: InputDecoration(
                //       //       prefixIcon: const Icon(Icons.search),
                //       //       hintText: "Search Something",
                //       //       border: OutlineInputBorder(
                //       //         borderRadius: BorderRadius.circular(30),
                //       //       )),
                //       // ),
                //       const SizedBox(
                //         height: 20,
                //       ),
                //     ],
                //   ),
                // ),

                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: home.categories.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 13,
                          ),
                      itemBuilder: (context, index) {
                        return FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('category')
                                .doc('RMnujiR0kCcqVxxBq4sv')
                                .collection(home.categories[index].onTap)
                                .get(),
                            builder: (context, snapshot) {
                              print(snapshot.data!.docs.isEmpty);
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ListProductScreen(
                                                snapshot: snapshot,
                                              )));
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.blue,
                                      child: Center(
                                        child: Icon(
                                          home.categories[index].icon,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(home.categories[index].name),
                                  ],
                                ),
                              );
                            });
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Featured",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.listProductScreen);
                      },
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 8,
                          ),
                      itemBuilder: (context, index) {
                        return const CustomProductCad(
                            img: 'assets/images/man.jpg',
                            price: 120,
                            title: "Man long T-shirt");
                      }),
                ),

                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Featured",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 8,
                          ),
                      itemBuilder: (context, index) {
                        return const CustomProductCad(
                            img: 'assets/images/man.jpg',
                            price: 120,
                            title: "Man long T-shirt");
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
