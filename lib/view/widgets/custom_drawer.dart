import 'package:firebase_ecommerce/view/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final home = context.watch<HomeViewModel>();

    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.shutterstock.com/image-photo/close-headshot-portrait-smiling-young-260nw-1769759990.jpg'),
              ),
              accountName: Text(
                "Thamer Kehail",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              accountEmail: Text(
                "thaerkehail@gmail.com",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
          ListTile(
            selected: home.homeSelected,
            onTap: () => home.changeSelected(0),
            leading: const Icon(Icons.home),
            title: const Text("Home"),
          ),
          ListTile(
            selected: home.cartSelected,
            onTap: () => home.changeSelected(1),
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Cart"),
          ),
          ListTile(
            selected: home.aboutSelected,
            onTap: () => home.changeSelected(2),
            leading: const Icon(Icons.info),
            title: const Text("About"),
          ),
          ListTile(
            selected: home.contactUsSelected,
            onTap: () => home.changeSelected(3),
            leading: const Icon(Icons.phone),
            title: const Text("Contact Us"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
