import 'package:flutter/material.dart';
import 'package:flutter_app/shopapp/screens/home_screen.dart';
import 'package:flutter_app/shopapp/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: "My Shop",
        theme: ThemeData(primarySwatch: Colors.indigo),
        routes: {
          '/': (ctx) => ProductsOverviewScreen(),
        },
      ),
    );
  }
}
