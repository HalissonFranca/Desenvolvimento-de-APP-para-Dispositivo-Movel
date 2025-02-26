import 'package:flutter/material.dart';
import 'model/product.dart';
import 'screens/product_list_screen.dart';
import 'screens/product_detail_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Produtos',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => ProductListScreen(),
        '/details': (context) => ProductDetailScreen(),
      },
    );
  }
}

