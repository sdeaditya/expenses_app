// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/meals/category_meals_screen.dart';
import 'package:flutter_app/meals/tabBar.dart';

import 'category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Quicksand'),
      routes: {
        '/': (context) => TabBarScreen(),
        MealsScreen.routeName: (context) => MealsScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings);
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
