import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/Products.dart';
import './Providers/Product.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final productsprovider = Provider.of<Products>(context);
    Product product = productsprovider.findProduct(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(child: Text(product.description)),
    );
  }
}
