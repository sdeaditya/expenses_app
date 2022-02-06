import 'package:flutter/material.dart';
import 'package:flutter_app/expenses/models/transaction.dart';
import 'package:flutter_app/expenses/new_transaction.dart';
import 'package:flutter_app/expenses/transactions_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

  void _addNewTransaction(String title, double amount) {
    print(title);
    print(amount);
    if (title != "" || amount != "") {
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
    return Container(
      child: Column(
        children: [
          NewTransaction(_addNewTransaction),
        ],
      ),
    );
  }
}
