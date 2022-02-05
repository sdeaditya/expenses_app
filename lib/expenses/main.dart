// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './transaction.dart';
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
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses App"),
      ),
      body: ListView(children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            color: Colors.blue,
            child: Text(
              'CHART',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Card(
            elevation: 4,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    decoration: InputDecoration(labelText: "Title"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(7),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Add transaction"),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: transactions.map((tx) {
              return Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Card(
                    child: Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            DateFormat().format(tx.date),
                            style: TextStyle(color: Colors.blueGrey),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "\$ " + tx.amount.toString(),
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                    ],
                  ),
                )),
              );
            }).toList(),
          ),
        )
      ]),
    );
  }
}
