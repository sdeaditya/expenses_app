import 'dart:developer';
import 'dart:math';

import './questions.dart';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(const MaterialApp(
  title: 'My App',
  home: SafeArea(child: MyScaffold()),
));

class MyApp2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp2> {
  var _questionIndex = 0;
  final _questions = [
    'Is your favourite sport basketball?',
    'Is your favourite coding language Java?'
  ];

  void _answerQuestions() {
    setState(() {
      _questionIndex = _questionIndex == (_questions.length - 1)
          ? _questionIndex
          : ++_questionIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Fluterr App"),
            ),
            body: Column(
              children: [
                Question(_questions[_questionIndex]),
                ElevatedButton(onPressed: onPressed, child: Text("Yes")),
                ElevatedButton(onPressed: onPressed, child: Text("No"))
              ],
            )));
  }

  onPressed() {
    _answerQuestions();
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, Key? key}) : super(key: key);

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: const BoxDecoration(color: Colors.blue),
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation Menu',
            onPressed: null,
          ),
          Expanded(child: title),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: const [
          MyAppBar(title: Text('Flutter App')),
          Expanded(
              child: Center(
            child: Text("Welcome to Flutter"),
          ))
        ],
      ),
    );
  }
}
