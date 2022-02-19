// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'category_item.dart';
import 'category_meals_screen.dart';
import 'dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: GridView(
            children: DUMMY_CATEGORIES
                .map((category) => CategoryItem(
                      title: category.title,
                      color: category.color,
                    ))
                .toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20)));
  }
}
