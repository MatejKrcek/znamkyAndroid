import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 450,
      child: transactions.isEmpty
          ? Column(
        children: <Widget>[
          Text(
            'Ty ještě nemáš žádné známky?',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 200,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              )),
        ],
      )
          : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('${transactions[index].weight}'),
                  ),
                ),
              ),
              title: Text(
                transactions[index].mark.toString(),
                style: Theme.of(context).textTheme.title,
              ),
//              trailing: IconButton(
//                icon: Icon(Icons.delete),
//                color: Theme.of(context).errorColor,
//                onPressed: () => deleteTx(transactions[index].id),
//              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
