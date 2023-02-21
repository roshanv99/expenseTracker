import 'package:expense_manager/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
    const Chart({required this.recentTransaction});

  List<Map<String,Object>> get groupTransactionValue {
    return List.generate(7, (index)  {
      final weekDay = DateTime.now().subtract(Duration(days:index));
      var totalSum;
      for(var i=0; i < recentTransaction.length; i++ ){
        if(recentTransaction[i].date.day == weekDay.day && 
        recentTransaction[i].date.month == weekDay.month && 
        recentTransaction[i].date.weekday == weekDay.weekday){
          totalSum += recentTransaction[i].amount;
        }
      }
      return {'day':DateFormat.E().format(weekDay),'amount':totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [

        ],
      ),
    );
  }
}