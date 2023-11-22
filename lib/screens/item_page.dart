import 'package:flutter/material.dart';
import 'package:invenetory_mobile/models/item.dart';
import 'package:invenetory_mobile/widgets/left_drawer.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Name: ${item.fields.name}"),
            Text("Amount: ${item.fields.amount}"),
            Text("Description: ${item.fields.description}"),
            Text("Code: ${item.fields.code}"),
            Text("Price: ${item.fields.price}"),
          ],
        ),
      ),
    );
  }
}
