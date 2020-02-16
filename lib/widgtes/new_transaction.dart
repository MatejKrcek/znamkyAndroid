import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  var btn1 = Colors.blue;
  var btn2 = Colors.blue;
  var btn3 = Colors.blue;
  var btn4 = Colors.blue;
  var btn5 = Colors.blue;

  var btn1Z = Colors.blue;
  var btn2Z = Colors.blue;
  var btn3Z = Colors.blue;
  var btn4Z = Colors.blue;
  var btn5Z = Colors.blue;

  final cervena = Colors.red;
  final modra = Colors.blue;
  final borderColor = Colors.red;
  var borderDefaul = Colors.white;
  int ulozitZnamku;
  int ulozitVahu;
  String alert = '';

  void _submitZnamka(int idZnamka) {
    setState(() {
      switch (idZnamka) {
        case 1:
          {
            btn1 = cervena;
            btn2 = modra;
            btn3 = modra;
            btn4 = modra;
            btn5 = modra;
            ulozitZnamku = 1;
          }
          break;
        case 2:
          {
            btn1 = modra;
            btn2 = cervena;
            btn3 = modra;
            btn4 = modra;
            btn5 = modra;
            ulozitZnamku = 2;
          }
          break;
        case 3:
          {
            btn1 = modra;
            btn2 = modra;
            btn3 = cervena;
            btn4 = modra;
            btn5 = modra;
            ulozitZnamku = 3;
          }
          break;
        case 4:
          {
            btn1 = modra;
            btn2 = modra;
            btn3 = modra;
            btn4 = cervena;
            btn5 = modra;
            ulozitZnamku = 4;
          }
          break;
        case 5:
          {
            btn1 = modra;
            btn2 = modra;
            btn3 = modra;
            btn4 = modra;
            btn5 = cervena;
            ulozitZnamku = 5;
          }
          break;
        default:
          {}
          break;
      }
    });
//    print('znamka ulozena $ulozitZnamku');
  }

  void _submitVaha(int idVaha) {
    setState(() {
      switch (idVaha) {
        case 1:
          {
            btn1Z = cervena;
            btn2Z = modra;
            btn3Z = modra;
            btn4Z = modra;
            btn5Z = modra;
            ulozitVahu = 1;
          }
          break;
        case 2:
          {
            btn1Z = modra;
            btn2Z = cervena;
            btn3Z = modra;
            btn4Z = modra;
            btn5Z = modra;
            ulozitVahu = 2;
          }
          break;
        case 3:
          {
            btn1Z = modra;
            btn2Z = modra;
            btn3Z = cervena;
            btn4Z = modra;
            btn5Z = modra;
            ulozitVahu = 3;
          }
          break;
        case 4:
          {
            btn1Z = modra;
            btn2Z = modra;
            btn3Z = modra;
            btn4Z = cervena;
            btn5Z = modra;
            ulozitVahu = 4;
          }
          break;
        case 5:
          {
            btn1Z = modra;
            btn2Z = modra;
            btn3Z = modra;
            btn4Z = modra;
            btn5Z = cervena;
            ulozitVahu = 5;
          }
          break;
        default:
          {}
          break;
      }
    });
//    print('vaha ulozena: $ulozitZnamku');
  }

  void _save() {
//    print('hodnota prijata znamka: $ulozitZnamku');
//    print('hodnota prijata vaha: $ulozitVahu');

    if (ulozitZnamku == null || ulozitVahu == null) {
      setState(() {
        alert = 'Vyber si prosím všechny hodnoty';
        borderDefaul = borderColor;
      });
      return;
    }

    if ((ulozitZnamku != null) && (ulozitVahu != null)) {
      widget.addTx(
        ulozitVahu,
        ulozitZnamku,
      );
    }

    ulozitZnamku = null;
    ulozitVahu = null;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Container(
          margin: EdgeInsets.only(top: 15),
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 10, bottom: 15),
                      child: RichText(
                        text: TextSpan(
                          text: 'Vyber si ',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'známku',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 17,
                                )),
                          ],
                        ),
                      )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(2.5),
                    width: MediaQuery.of(context).size.width * 0.13,
                    alignment: Alignment.center,
                    child: RawMaterialButton(
                      onPressed: () => _submitZnamka(1),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: new CircleBorder(),
                      fillColor: btn1,
                      padding: const EdgeInsets.all(14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2.5),
                    width: MediaQuery.of(context).size.width * 0.13,
                    alignment: Alignment.center,
                    child: RawMaterialButton(
                      onPressed: () => _submitZnamka(2),
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: new CircleBorder(),
                      fillColor: btn2,
                      padding: const EdgeInsets.all(14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2.5),
                    width: MediaQuery.of(context).size.width * 0.13,
                    alignment: Alignment.center,
                    child: RawMaterialButton(
                      onPressed: () => _submitZnamka(3),
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: new CircleBorder(),
                      fillColor: btn3,
                      padding: const EdgeInsets.all(14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2.5),
                    width: MediaQuery.of(context).size.width * 0.13,
                    alignment: Alignment.center,
                    child: RawMaterialButton(
                      onPressed: () => _submitZnamka(4),
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: new CircleBorder(),
                      fillColor: btn4,
                      padding: const EdgeInsets.all(14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2.5),
                    width: MediaQuery.of(context).size.width * 0.13,
                    alignment: Alignment.center,
                    child: RawMaterialButton(
                      onPressed: () => _submitZnamka(5),
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: new CircleBorder(),
                      fillColor: btn5,
                      padding: const EdgeInsets.all(14),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        bottom: 15,
                        top: 30,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: 'Vyber si ',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'váhu',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 17,
                                )),
                          ],
                        ),
                      )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(2.5),
                    width: MediaQuery.of(context).size.width * 0.13,
                    alignment: Alignment.center,
                    child: RawMaterialButton(
                      onPressed: () => _submitVaha(1),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: new CircleBorder(),
                      fillColor: btn1Z,
                      padding: const EdgeInsets.all(14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2.5),
                    width: MediaQuery.of(context).size.width * 0.13,
                    alignment: Alignment.center,
                    child: RawMaterialButton(
                      onPressed: () => _submitVaha(2),
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: new CircleBorder(),
                      fillColor: btn2Z,
                      padding: const EdgeInsets.all(14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2.5),
                    width: MediaQuery.of(context).size.width * 0.13,
                    alignment: Alignment.center,
                    child: RawMaterialButton(
                      onPressed: () => _submitVaha(3),
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: new CircleBorder(),
                      fillColor: btn3Z,
                      padding: const EdgeInsets.all(14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2.5),
                    width: MediaQuery.of(context).size.width * 0.13,
                    alignment: Alignment.center,
                    child: RawMaterialButton(
                      onPressed: () => _submitVaha(4),
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: new CircleBorder(),
                      fillColor: btn4Z,
                      padding: const EdgeInsets.all(14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2.5),
                    width: MediaQuery.of(context).size.width * 0.13,
                    alignment: Alignment.center,
                    child: RawMaterialButton(
                      onPressed: () => _submitVaha(5),
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: new CircleBorder(),
                      fillColor: btn5Z,
                      padding: const EdgeInsets.all(14),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    child: RaisedButton(
                      child: Text(
                        'Uložit',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                      color: Colors.white,
                      textColor: Theme.of(context).textTheme.button.color,
                      onPressed: () {
                        _save();
                      },
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: borderDefaul, width: 2,),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '$alert',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
