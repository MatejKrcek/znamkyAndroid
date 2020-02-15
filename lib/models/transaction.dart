import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final int mark;
  final int weight;

  Transaction({
    @required this.id,
    @required this.mark,
    @required this.weight,
  });
}