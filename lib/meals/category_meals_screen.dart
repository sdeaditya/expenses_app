// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  // final String category;
  static const routeName = 'meals';
  const MealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryTitle meals"),
      ),
      body: Container(
        child: Center(
          child: Text("Meals Screen"),
        ),
      ),
    );
  }
}
