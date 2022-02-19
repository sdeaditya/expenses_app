// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/expenses/new_transaction.dart';
import 'package:flutter_app/expenses/transactions_list.dart';
import 'package:flutter_app/expenses/user_transactions.dart';

import './models/transaction.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenses App",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Quicksand'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> _transactions = [];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
  }

  void _startNewTx(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  void _addNewTransaction(String title, double amount) {
    if (title != "" && amount != "") {
      final tx = Transaction(
          title: title,
          amount: amount,
          date: DateTime.now(),
          id: DateTime.now().toString());

      setState(() {
        _transactions.add(tx);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text("Expenses App"),
      actions: [
        IconButton(onPressed: () => _startNewTx(context), icon: Icon(Icons.add))
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: ListView(children: <Widget>[
        Container(
          height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top) *
              0.3,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Card(
            color: Colors.teal,
            child: Text(
              'CHART',
            ),
          ),
        ),
        // UserTransactions(),
        Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.6,
            child: TransactionList(_transactions))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startNewTx(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
