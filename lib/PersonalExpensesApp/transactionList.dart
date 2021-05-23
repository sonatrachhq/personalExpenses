import 'package:flutter/material.dart';
import 'package:flutter_app/PersonalExpensesApp/transaction.dart';
import 'package:flutter_app/PersonalExpensesApp/transactionItem.dart';

class TransactionList extends StatelessWidget {
final List<Transaction> transactions;
final Function deleteTx;
TransactionList(this.transactions,this.deleteTx);



  @override
  Widget build(BuildContext context) {
    return
      Container(
     //height: MediaQuery.of(context).size.height*0.6,
      child: transactions.isEmpty? LayoutBuilder(builder: (context,constraints){
        return  Column(
          children: [
            Text(
              'No transaction added yet !',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(
              height: constraints.maxHeight*0.05,
            ),
            Container(
              height: constraints.maxHeight*0.6,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),

          ],
        );
      })
     :ListView.builder(
        itemBuilder: (context,index){
          return TransactionItem(transactions[index], deleteTx);

        },
        itemCount: transactions.length,
      ),
    );
  }
}
