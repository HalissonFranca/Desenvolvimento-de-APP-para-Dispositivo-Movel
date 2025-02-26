import '../model/product.dart';
import 'package:flutter/material.dart';
class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Sapato', description: 'Um sapato formal.', price: 399.99, imageUrl: 'https://cdn.pixabay.com/photo/2017/08/20/10/28/leather-shoes-2661198_1280.jpg'),
    Product(name: 'Fone de Ouvido', description: 'Fone de ouvido com cancelamento de ruído.', price: 299.99, imageUrl: 'https://cdn.pixabay.com/photo/2020/09/23/20/28/headphones-5596990_1280.jpg'),
    Product(name: 'Pizza', description: 'Pizza de queijo e pepperoni.', price: 39.99, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_1280.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loja Online')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(product.name),
              subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
              onTap: () {
                Navigator.pushNamed(context, '/details', arguments: product);
              },
            ),
          );
        },
      ),
    );
  }
}
