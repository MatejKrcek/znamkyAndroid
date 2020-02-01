import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _markController = TextEditingController();
  final _weightController = TextEditingController();

  void _submitData() {
    if (_weightController.text.isEmpty || _markController.text.isEmpty) {
      return;
    }
    final enteredMark = int.parse(_markController.text);
    final enteredWeight = int.parse(_weightController.text);

    if (enteredMark == 0 || enteredWeight == 0 || (enteredWeight > 5) || enteredMark > 10) {
    }

    widget.addTx(
      enteredMark,
      enteredWeight,
    );

    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Známka'),
              controller: _weightController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Váha'),
              controller: _markController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            RaisedButton(
              child: Text('Přidat známku'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
