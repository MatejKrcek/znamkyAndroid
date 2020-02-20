import 'package:flutter/foundation.dart';

class Transaction {
  final int id;
  final int mark;
  final int weight;

  Transaction({
    @required this.id,
    @required this.mark,
    @required this.weight,
  });
}
