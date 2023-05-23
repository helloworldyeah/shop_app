import 'package:flutter/material.dart';
import './ProductDetails.dart';
import './Providers/Carts.dart';
import './Providers/Products.dart';
import './screens/ShopingCart_screen.dart';
import '../screens/Product_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Products()),
          ChangeNotifierProvider(create: (context) => Carts())
        ],
        child: MaterialApp(
          // Application name
          title: 'Flutter Hello World',
          debugShowCheckedModeBanner: false,
          // Application theme data, you can set the colors for the application as
          // you want
          theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.deepOrange),
            primarySwatch: Colors.deepOrange,
          ),
          // A widget which will be started on application startup
          home: ProductOverview(),
          initialRoute: '/Home',

          routes: {
            '/Home': (context) => ProductOverview(),
            'product-details': (context) => ProductDetails(),
            'Shopping-screen': (context) => ShoppingScreen(),
          },
        ));
  }
}
