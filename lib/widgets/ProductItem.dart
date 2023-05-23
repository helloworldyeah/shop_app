import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/Carts.dart';
import 'package:shopapp/Providers/Product.dart';

class ProductItem extends StatelessWidget {
  /*  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl); */

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final Cartsdata = Provider.of<Carts>(context, listen: false);

    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
            onTap: () => {
                  Navigator.of(context)
                      .pushNamed('product-details', arguments: product.id)
                },
            child: GridTile(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                  backgroundColor: Colors.black87,
                  leading: IconButton(
                      icon: product.isFavretes
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                      color: Colors.deepOrange,
                      onPressed: () {
                        product.toggleisfav();
                      }),
                  title: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            product.title,
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.shopping_bag_outlined),
                    onPressed: () {
                      Cartsdata.additem(
                          product.id, product.title, product.price);
                    },
                    color: Colors.deepOrange,
                  )),
            )));
  }
}
