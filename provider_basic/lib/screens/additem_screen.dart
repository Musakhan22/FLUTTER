import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/providers/item_add_notifier.dart';
import 'package:provider_basic/providers/shop_name_notifier.dart';

class AddItemScreen extends StatelessWidget {
  final String title = 'Add Items';
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();


  AddItemScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _itemNameController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Enter Item',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Add Item',),
              onPressed: () async {
                if (_itemNameController.text.isEmpty) {
                  return;
                }
                  await Provider.of<ItemAddNotifier>(context, listen: false)
                   .addItem(_itemNameController.text);
                   Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Add Item Screen',),
               onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) {
                    return AddItemScreen();
                  },
                ),
              );
            },
            ),
            TextField(
              controller: _shopNameController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Shop Name',
              ),
            ),
            ElevatedButton(
              child: const Text('UPDATE SHOP NAME'),
               onPressed: () async {
                if (_shopNameController.text.isEmpty) { 
                  return;
                }
                  await Provider.of<ShopNameNotifier>(context, listen: false)
                   .updateShopName(_shopNameController.text);
                   Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
