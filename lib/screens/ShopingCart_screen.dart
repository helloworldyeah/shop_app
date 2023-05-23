import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/ShoppingCartItem.dart';
import '../Providers/Carts.dart';

class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Carddata = Provider.of<Carts>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Shopping Cart")),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 50,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'total',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Chip(
                          label: Text(
                        '\$${Carddata.totalamount()}',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )),
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: Carddata.itemlength(),
            itemBuilder: (context, index) => ShoppingCartItem(
                Carddata.items.values.toList()[index].id,
                Carddata.items.keys.toList()[index],
                Carddata.items.values.toList()[index].price,
                Carddata.items.values.toList()[index].title,
                Carddata.items.values.toList()[index].quantity),
          ))
        ],
      ),
    );
  }
}
