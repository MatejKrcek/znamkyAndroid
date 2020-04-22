import 'package:flutter/material.dart';
import '../models/mark.dart';

class MarkList extends StatelessWidget {
  final List<Mark> transactions;
  final Function removeMark;

  MarkList(this.transactions, this.removeMark);

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: MediaQuery.of(context).size.height * 0.6,
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
                  height: 50,
                ),
//                Container(
//                  margin: const EdgeInsets.only(top: 20),
//                  child: const FlatButton(
//                    child: const Text(
//                      'Přidat známku',
//                      style: TextStyle(),
//                    ),
//                  ),
//                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
//                    bottom: BorderSide(
//                      color: Colors.grey,
//                      width: 1,
//                    ),
                ),
              ),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  final item = transactions[index].id.toString();
                  return Dismissible(
                    key: Key(item),
                    onDismissed: (direction) {
                      removeMark(index);
                      print(index);
                    },
                    background: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(25),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(25),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 1,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(
                                            left: 13,
                                            bottom: 5,
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            child: Text(
                                              transactions[index]
                                                  .weight
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 35, bottom: 5),
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
                                          margin:
                                              const EdgeInsets.only(left: 20),
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 40),
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                            icon: Icon(Icons.delete),
                                            color: Colors.redAccent,
                                            onPressed: () {
                                              removeMark(index);
                                            },
                                            tooltip: 'Odstranit tuto známku',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
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
