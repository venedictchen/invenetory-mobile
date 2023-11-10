import 'package:flutter/material.dart';

class Item {
  final String name;
  final int amount;
  final int code;
  final int price;
  final String description;

  Item(this.name, this.amount, this.code, this.price, this.description);
}

class InventoryItem extends StatelessWidget {
  final Item item;

  const InventoryItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(
              item.name,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 24),
              overflow: TextOverflow.ellipsis,
            ),
            
            const Padding(padding: EdgeInsets.all(5)),
            Text(
              'Amount: ${item.amount.toString()}',
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
            const Padding(padding: EdgeInsets.all(1)),
            Text(
              'Code: ${item.code.toString()}',
              style: const TextStyle(color: Colors.black, fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
            const Padding(padding: EdgeInsets.all(1)),
            Text(
              'Harga: ${item.price.toString()}',
              style: const TextStyle(color: Colors.black, fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
            const Padding(padding: EdgeInsets.all(1)),
            Text(
              item.description,
              style: const TextStyle(color: Colors.black, fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
            const Padding(padding: EdgeInsets.all(1)),
          ],
        ),
      ),
    );
  }
}
