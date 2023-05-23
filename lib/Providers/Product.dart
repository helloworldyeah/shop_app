import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavretes = false;

  Product(this.id, this.title, this.description, this.price, this.imageUrl);

  void toggleisfav() {
    isFavretes = !isFavretes;
    notifyListeners();
  }
}
