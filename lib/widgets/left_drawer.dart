import 'package:flutter/material.dart';
import 'package:invenetory_mobile/screens/inventory_list.dart';
import 'package:invenetory_mobile/screens/menu.dart';
import 'package:invenetory_mobile/screens/inventory_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_){
        CookieRequest request = CookieRequest();
        return request;
      

      },child: Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              children: [
                Text(
                  'Invenetory',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Track seluruh stok barang kamu disini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke InventoryFormPage
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InventoryFormPage()));
            },
          ),
          ListTile(
          leading: const Icon(Icons.inventory_rounded),
          title: const Text('Lihat Item'),
          // Bagian redirection ke InventoryListPage
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InventoryListPage()));
          },
          ),
        ],
      ),
    ),);
  }
}
