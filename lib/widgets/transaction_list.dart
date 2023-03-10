import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transactions.dart';

class TransactionList extends StatelessWidget {  
  final amountInput = TextEditingController();
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (contex,index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '₹ ${transactions[index].amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(transactions[index].title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(DateFormat('dd-MM-yyyy').format(transactions[index].date),
                        style: TextStyle(color: Colors.grey))
                  ],
                )
              ],
            ),
          );
         
        },
        itemCount: transactions.length,
      ),
    );
         
  }
}