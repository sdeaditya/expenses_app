import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem({required this.id, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(imageUrl),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            title,
            textAlign: TextAlign.start,
          ),
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.favorite,)),
          trailing: IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
