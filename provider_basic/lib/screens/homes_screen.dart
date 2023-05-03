import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/providers/shop_name_notifier.dart';

import '../providers/item_add_notifier.dart';
import '../screens/additem_screen.dart';

class HomeScreens extends StatelessWidget {
  final String title = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
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
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Consumer<ItemAddNotifier>(
                builder: (context, itemAddNotifier, _) {
                  return ListView.builder(
                    itemCount: itemAddNotifier.itemList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          itemAddNotifier.itemList[index].itemName,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Consumer<ShopNameNotifier>(
              builder: (context,shopNameNotifier,_){
                return Text('Shop Name: ${shopNameNotifier.shopName}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
