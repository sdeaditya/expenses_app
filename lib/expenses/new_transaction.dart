import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addHandler;

  NewTransaction(this.addHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: titleController,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountController,
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(7),
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text != "" &&
                      amountController.text != "") {
                    addHandler(titleController.text,
                        double.parse(amountController.text));
                  }
                },
                child: Text("Add transaction"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
