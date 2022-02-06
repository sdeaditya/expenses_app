// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/expenses/new_transaction.dart';
import 'package:flutter_app/expenses/transactions_list.dart';
import 'package:flutter_app/expenses/user_transactions.dart';

import './models/transaction.dart';
import 'package:intl/intl.dart';

void main() {
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

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: '1',
        title: 'New Shoes',
        amount: 29.9,
        date: DateTime(2022, 1, 20, 12, 00)),
    Transaction(
        id: '2',
        title: 'New Bag',
        amount: 39.9,
        date: DateTime(2022, 1, 20, 12, 00)),
    Transaction(
        id: '3',
        title: 'New Phone',
        amount: 299.9,
        date: DateTime(2022, 1, 20, 12, 00)),
  ];

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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses App"),
        actions: [
          IconButton(
              onPressed: () => _startNewTx(context), icon: Icon(Icons.add))
        ],
      ),
      body: ListView(children: <Widget>[
        Container(
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
        TransactionList(_transactions)
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startNewTx(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
