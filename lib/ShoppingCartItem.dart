import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/Carts.dart';

class ShoppingCartItem extends StatelessWidget {
  final String productid;
  final String id;
  final double price;
  final int quentity;
  final String title;

  ShoppingCartItem(
      this.id, this.productid, this.price, this.title, this.quentity);

  @override
  Widget build(BuildContext context) {
    final Cartdata = Provider.of<Carts>(context);

    return Dismissible(
        key: ValueKey(id),
        background: Container(
          color: Colors.red,
          child: Icon(Icons.delete, color: Colors.white),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => Cartdata.removeitem(productid),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  '\$${price}',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              title: Text(title),
              subtitle: Text("just Product"),
              trailing: Text('x${quentity}'),
            ),
          ),
        ));
  }
}
