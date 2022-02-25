import 'package:flutter/material.dart';
import 'package:flutter_app/shopapp/models/product.dart';
import 'package:flutter_app/shopapp/providers/products.dart';
import 'package:flutter_app/shopapp/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: ProductsGrid(),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (ctx, index) => ProductItem(
            id: products[index].id,
            title: products[index].title,
            imageUrl: products[index].imageUrl));
  }
}
