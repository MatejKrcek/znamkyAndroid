import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Settings extends StatelessWidget {
  void feedback() {
    HapticFeedback.vibrate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Info a feedback"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 20),
                  child: const Text(
                    'Jak to funguje?',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Wrap(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: const Text(
                          'Aplikace počítá vážený průměr na základě známek  a váh, které zadáte.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                            size: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: const Text(
                              'Popelnice v menu - smaže všechny známky',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.compare_arrows,
                            size: 20,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: const Text(
                              'Swipe - odstraní konkrétní známku',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      )

                    ],

                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 20),
                  child: const Text(
                    'O nás',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'Verze: 1.0.0',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'Poslední update: 13. 3. 2020',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'Kontakt: pocitadlo.znamek@krcek.cz',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//Contact email: matej.dev@krcek.cz
