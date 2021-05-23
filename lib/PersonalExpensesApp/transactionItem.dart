import 'package:flutter/material.dart';
import 'package:flutter_app/PersonalExpensesApp/transaction.dart';
import 'package:intl/intl.dart';
class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTx;
  const TransactionItem(this.transaction,this.deleteTx) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                  '\$${transaction.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(transaction.title),
        subtitle: Text(
          DateFormat.yMEd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
          onPressed: () => deleteTx(transaction.id),
          icon: Icon(
            Icons.delete,
            color: Colors.red[500],
          ),
          label: Text(
            'delete',
            style: TextStyle(
              color: Colors.red[500],
            ),
          ),
        )
            : IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red[500],
          ),
          onPressed: () => deleteTx(transaction.id),
        ),
      ),
    );
  }
}

//instead of using card and rows.. we can use ListTile
/*Card(
            child: Row(
              children: [
                Container(
                  child: Text(
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      )
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat.yMEd()
                          .format(transactions[index].date),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );*/
