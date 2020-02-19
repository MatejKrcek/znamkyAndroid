import 'package:flutter/material.dart';

import './widgtes/new_transaction.dart';
import './widgtes/transaction_list.dart';
import './models/transaction.dart';
import './settings.dart';

import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Počítadlo známek',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.red,
          // errorColor: Colors.red,
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                button: TextStyle(color: Colors.white),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  List<int> markList = [0];
  List<int> weightList = [0];
  List<int> position = [];

  double prumer = 0;

  void _addNewTransaction(int txMark, int txWeight) {
    final newTx = Transaction(
      mark: txMark,
      weight: txWeight,
      id: DateTime.now().toString(),
    );

    double citatel = 0;
    double jmenovatel = 0;

    setState(() {
//      position.forEach((element) {
//        if (position.contains(element) ) {
//
//        }
//      });
      _userTransactions.insert(0, newTx);
      markList.insert(0, txWeight);
      weightList.insert(0, txMark);
    });

    for (int i = 0; i < markList.length; i++) {
      citatel = citatel + (markList[i].toDouble() * weightList[i].toDouble());
      jmenovatel = jmenovatel + weightList[i].toDouble();
    }
    position.add(markList.length); //pokud neni zadna znamka, delka je 1
    prumer = citatel / jmenovatel; //pokud je 1 znamka, delka je 2

//    print('pozice: $position');
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

//  void _deleteTransaction(String id) {
//    setState(() {
//      _userTransactions.removeWhere((tx) => tx.id == id);
//    });
////    print('smazano');
//  }

  void removeMark() {
    double citatel = 0;
    double jmenovatel = 0;

    setState(() {
      _userTransactions.removeAt(0);
//      _userTransactions.removeWhere((tx) => tx.id == id);
      markList.removeAt(0);
      weightList.removeAt(0);
      position.removeAt(0);
    });

//    print('znamky: $markList');
//    print('pozice: $position');

    for (int i = 0; i < markList.length; i++) {
      citatel = citatel + (markList[i].toDouble() * weightList[i].toDouble());
      jmenovatel = jmenovatel + weightList[i].toDouble();
    }
//    position.add(markList.length); //pokud neni zadna znamka, delka je 1
//    position.removeAt(0); //pokud neni zadna znamka, delka je 1

    prumer = citatel / jmenovatel; //pokud je 1 znamka, delka je 2
  }

  void execute() {
    setState(() {
      _userTransactions.clear();
      markList.removeAt(0);
      weightList.removeAt(0);
      position.removeAt(0);
    });
    HapticFeedback.vibrate();
    prumer = 0;
    print('dlouho');
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(
        'Počítadlo známek',
      ),
      actions: <Widget>[
        TouchableOpacity(
          activeOpacity: 0.4,
          child: GestureDetector(
            onTap: removeMark,
            onLongPress: execute,
            child: Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Settings()),
            );
          },
          tooltip: 'O nás',
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 0, bottom: 0, left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.15,
                margin: EdgeInsets.only(bottom: 0),
                child: Center(
                  child: Text(
                    'Aktuální průměr: ${prumer.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.75,
                  child: TransactionList(_userTransactions, removeMark)),
//              Listener(
//                onPointerDown: (details) {
//                  _buttonPressed = true;
//                  _increaseCounterWhilePressed();
//                },
//                onPointerUp: (details) {
//                  _buttonPressed = false;
//                },
//              ),
//              Container(
//                height: (MediaQuery.of(context).size.height -
//                        appBar.preferredSize.height -
//                        MediaQuery.of(context).padding.top) *
//                    0.1,
//                decoration: BoxDecoration(
//                  color: Colors.grey,
//                  border: Border.all(color: Colors.grey),
//                  borderRadius: BorderRadius.circular(6),
//                ),
//                child: Text(
//                  'a place for your ad',
//                  style: TextStyle(fontSize: 20, color: Colors.white),
//                  textAlign: TextAlign.center,
//                ),
//              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
        tooltip: 'Přidat novou známku',
      ),
    );
  }
}
