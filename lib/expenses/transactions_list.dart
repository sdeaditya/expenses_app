import 'package:flutter/material.dart';
import 'package:flutter_app/expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: ListView.builder(
        itemBuilder: (context, index) {
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
                        transactions[index].title,
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        DateFormat().format(transactions[index].date),
                        style: TextStyle(color: Colors.blueGrey),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "\$ " + transactions[index].amount.toStringAsFixed(2),
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
        },
        itemCount: transactions.length,
      ),
    );
  }
}
