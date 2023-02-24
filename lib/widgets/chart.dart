import 'package:expense_manager/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
    const Chart({required this.recentTransaction});

  List<Map<String,Object>> get groupTransactionValue {
    return List.generate(7, (index)  {
      final weekDay = DateTime.now().subtract(Duration(days:index));
      var totalSum = 0;
      for(var i=0; i < recentTransaction.length; i++ ){
        if(recentTransaction[i].date.day == weekDay.day && 
        recentTransaction[i].date.month == weekDay.month && 
        recentTransaction[i].date.weekday == weekDay.weekday){
          totalSum += recentTransaction[i].amount;
        }
      }
      return {'day':DateFormat.E().format(weekDay).substring(0,1),
      'amount':totalSum
      };
    }).reversed.toList();
  }

  num get totalSpending {
    return groupTransactionValue.fold(0, (sum, item)  {
      return sum  + (item['amount'] as num);
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...groupTransactionValue.map((data) {
              return Flexible(
                fit:FlexFit.tight,
                child: ChartBar((
                data['day'] as String), 
                (data['amount'] as int), 
                totalSpending == 0.0 ? 0.0 : ((data['amount'] as num)/totalSpending))
              ); 
            })
          ],
        ),
      ),
    );
  }
}