import 'package:flutter/material.dart';

import './widgtes/new_transaction.dart';
import './widgtes/transaction_list.dart';
import './models/transaction.dart';
import './settings.dart';

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
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
            title: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            button: TextStyle(color: Colors.white),
          ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData
                .light()
                .textTheme
                .copyWith(
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
  // String titleInput;
  // String amountInput;
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
      _userTransactions.add(newTx);
      markList.add(txWeight);
      weightList.add(txMark);
    });

    for (int i = 0; i < markList.length; i++) {
      citatel = citatel + (markList[i].toDouble() * weightList[i].toDouble());
      jmenovatel = jmenovatel + weightList[i].toDouble();
    }
    position.add(markList.length); //pokud neni zadna znamka, delka je 1
    prumer = citatel / jmenovatel; //pokud je 1 znamka, delka je 2
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

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void removeMark() {
    double citatel = 0;
    double jmenovatel = 0;

    setState(() {
      _userTransactions.removeLast();
      markList.removeLast();
      weightList.removeLast();
    });

    for (int i = 0; i < markList.length; i++) {
      citatel = citatel + (markList[i].toDouble() * weightList[i].toDouble());
      jmenovatel = jmenovatel + weightList[i].toDouble();
    }
    position.add(markList.length); //pokud neni zadna znamka, delka je 1
    prumer = citatel / jmenovatel; //pokud je 1 znamka, delka je 2
  }

  void execute() {
    removeMark();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Počítadlo známek',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
            tooltip: 'Nastavení',
          ),
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.redAccent,
            onPressed: () {
              execute();
//              Displaysnackbar();
            },
            tooltip: 'Odstranit poslední známku',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Aktuální průměr: ${prumer.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 5,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
              ),
              TransactionList(_userTransactions, _deleteTransaction),
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
