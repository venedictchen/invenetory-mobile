import 'package:flutter/material.dart';
import 'package:invenetory_mobile/widgets/left_drawer.dart';
import 'package:invenetory_mobile/widgets/inventory_item.dart';

class InventoryListPage extends StatelessWidget {
  InventoryListPage({Key? key}) : super(key: key);

  final List<Item> dummy = [
    Item(
      'Item 1',
      10,
      12345,
      50,
      'This is the description for item 1.',
    ),
    Item(
      'Item 2',
      5,
      67890,
      30,
      'This is the description for item 2.wdadawdwdawdawdawdawdawdawdawdawdadawd',
    ),
    Item(
      'Item 3',
      15,
      11110,
      20,
      'This is the description for item 3.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inventory',
          style: TextStyle(
            color: Colors.green,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                'Inventory',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: dummy.map((Item item) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: InventoryItem(item),
                );
              }).toList(
              ),
            ),
          ],
        ),
      ),
    );
  }
}
