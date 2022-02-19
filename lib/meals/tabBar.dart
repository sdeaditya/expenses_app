// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/meals/category_screen.dart';
import 'package:flutter_app/meals/favourite_screen.dart';

class TabBarScreen extends StatefulWidget {
  @override
  State<TabBarScreen> createState() => _TabBarState();
}

class _TabBarState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meals"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: TabBar(
              tabs: const [
                Tab(
                  icon: Icon(Icons.category),
                  text: "Categories",
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: "Favourites",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [CategoryScreen(), FavouriteScreen()]),
      ),
    );
  }
}
