import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'Ty ještě nemáš žádné známky?',
                    style: TextStyle(fontSize: 18),
                  ),
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
          : Container(
//              decoration: BoxDecoration(
//                border: Border.all(
//                  color: Colors.red,
//                  width: 2,
//                ),
//                borderRadius: BorderRadius.circular(5),
//              ),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 13, bottom: 5),
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text(
                                    transactions[index].weight.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 35, bottom: 5),
                                child: Text(
                                  transactions[index].mark.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: const Text(
                                  'Známka',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: const Text(
                                  'Váha',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
            ),
    );
  }
}