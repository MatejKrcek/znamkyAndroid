import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgtes/new_mark.dart';
import './widgtes/mark_list.dart';
import './models/mark.dart';
import './settings.dart';

import 'package:touchable_opacity/touchable_opacity.dart';
// import 'package:firebase_admob/firebase_admob.dart';
// import 'package:admob_flutter/admob_flutter.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

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

String prijatyBtn;
String idZ;
List<int> markList = [0];
List<int> weightList = [0];

class _MyHomePageState extends State<MyHomePage> {
  final List<Mark> _userTransactions = [];

  List<int> position = [];
  List<String> idList = [];

  double prumer = 0;

  void _addNewTransaction(int txMark, int txWeight, int txId) {
    final newTx = Mark(
      mark: txMark,
      weight: txWeight,
      id: txId,
    );

    double citatel = 0;
    double jmenovatel = 0;

    //idZ = new DateTime.now().second.toString();

    setState(() {
      _userTransactions.insert(0, newTx);
      markList.insert(0, txWeight);
      weightList.insert(0, txMark);
      //idList.insert(0, idZ);
    });

    //print('zapis id: $idList');

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
          child: NewMark(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void removeMark(i) {
    double citatel = 0;
    double jmenovatel = 0;

    print('a');

    setState(() {
      _userTransactions.removeAt(i);
      markList.removeAt(i);
      weightList.removeAt(i);

    });

    for (int i = 0; i < markList.length; i++) {
      citatel = citatel + (markList[i].toDouble() * weightList[i].toDouble());
      jmenovatel = jmenovatel + weightList[i].toDouble();
    }

    prumer = citatel / jmenovatel; //pokud je 1 znamka, delka je 2

    //print(prumer);

    if (prumer.isNaN) {
      prumer = 0;
    }
  }

  void execute() {
    setState(() {
      _userTransactions.clear();
      markList.clear();
      weightList.clear();
      position.clear();
      idList.clear();
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
            onTap: execute,
            //onLongPress: execute,
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
                  child: MarkList(_userTransactions, removeMark)),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
        tooltip: 'Přidat novou známku',
        backgroundColor: Colors.blue,
      ),
    );
  }
}
