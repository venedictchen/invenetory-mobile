import 'package:flutter/material.dart';
import 'package:invenetory_mobile/widgets/left_drawer.dart';
import 'package:invenetory_mobile/widgets/inventory_item.dart';

class InventoryListPage extends StatelessWidget {
  const InventoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inventory',
          style: TextStyle(
            color: Colors.green,
            fontSize: 20, 
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: 
      Padding(
        padding: const EdgeInsets.all(10.0),
        
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                'Your Items',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  shrinkWrap: true,
                  children: Item.dummy.map((Item item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: InventoryItem(item),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
