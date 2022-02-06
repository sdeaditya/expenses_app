// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addHandler;

  NewTransaction(this.addHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "New Transaction",
                  style: TextStyle(color: Colors.blueGrey),
                )),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.grey)),
                controller: titleController,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Amount",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.grey)),
                controller: amountController,
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: onSubmit,
                child: Text("Add"),
              ),
            )
          ],
        ),
      ),
    );
  }

  onSubmit() {
    if (titleController.text != "" && amountController.text != "") {
      final title = titleController.text;
      final amount = double.parse(amountController.text);
      if (title.isNotEmpty && amount >= 0) {
        widget.addHandler(title, amount);
        Navigator.of(context).pop();
      }
    }
  }
}
