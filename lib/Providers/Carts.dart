import 'package:flutter/material.dart';

class Cart {
  final String id;
  final String title;
  final int quantity;
  double price;

  Cart(this.id, this.title, this.price, this.quantity);
}

class Carts with ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items {
    return {..._items};
  }

  int itemlength() {
    return _items.length;
  }

  double totalamount() {
    double totalamount = 0.0;
    _items.forEach((key, value) {
      totalamount += value.price * value.quantity;
    });
    return totalamount;
  }

  bool itemexist(String productid) {
    return (_items.containsKey(productid)) as bool;
  }

  void removeitem(String productid) {
    _items.remove(productid);
    notifyListeners();
  }

  void additem(String productid, String title, double price) {
    if (_items.containsKey(productid)) {
      _items.update(
          productid,
          (existingvalue) => Cart(existingvalue.id, existingvalue.title,
              existingvalue.price, existingvalue.quantity + 1));
    } else {
      _items.putIfAbsent(
          productid, () => Cart((DateTime.now()).toString(), title, price, 1));
    }
    notifyListeners();
  }
}
