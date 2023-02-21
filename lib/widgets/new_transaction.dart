import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  String? titleInput;
  final amountInput = TextEditingController();
  void submitData(){
    final enteredTitle = titleInput;
    final enteredAmount = int.parse(amountInput.text);
    print('==>   ${enteredAmount.toString()}  ${enteredTitle}!');
    if (enteredTitle == '' || enteredAmount <=0 ){
      return;
    }
    widget.addTx(titleInput,int.parse(amountInput.text));
    Navigator.of(context).pop();
  }

  @override 
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            onChanged: (value) {
              titleInput = value;
            },
            onSubmitted: (_) => submitData,
            textInputAction: TextInputAction.next,
            ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountInput,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData,
            ),
          OutlinedButton(
            onPressed: submitData,
            child: const Text('Add Transaction',style: TextStyle(color: Colors.purple)),
          )
        ]),
      ),
    );           
  }
}