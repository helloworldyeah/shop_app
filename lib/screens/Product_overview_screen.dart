import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/Carts.dart';
import 'package:shopapp/Providers/Products.dart';
import 'package:shopapp/widgets/Badgee.dart';
import '../widgets/ProductItem.dart';
import '../Providers/Product.dart';

class ProductOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Productsdata = Provider.of<Products>(context);
    final products = Productsdata.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        actions: [
          Consumer<Carts>(
            builder: (context, value, ch) => Badgee(
                IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).pushNamed('Shopping-screen');
                    }),
                (value.itemlength()).toString(),
                Colors.red),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider(
          create: (c) => products[index],
          child: ProductItem(),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
