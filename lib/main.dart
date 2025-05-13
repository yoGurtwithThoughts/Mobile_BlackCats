import 'package:black_cat/model/cart_provider.dart';
import 'package:black_cat/pages/ad_page.dart';
import 'package:black_cat/pages/cart_page.dart';
import 'package:black_cat/pages/splash_screen.dart';
import 'package:black_cat/pages/store_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      fontFamily: 'MainFont',),
      initialRoute: "/",
      routes: {
        '/': (context) => SplashScreen(),
        '/ad': (context) => AdPage(),
        '/st': (context) => StorePage(onAddToCart: (Product ) {  },),
        '/cart': (context) => CartPage(cartItems: [], onIncrement: (Product ) {  },
         onRemove: (Product ) {  }, onDecrement: (Product ) {  },),
      },
    );
  }
}
