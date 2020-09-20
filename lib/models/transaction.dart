import 'package:flutter/material.dart';

class Transaction {
  //fields
  final String id;
  final String title;
  final double amount;
  final DateTime date;

//We add a constructor with named arguments i.e. We will be able to call d ctor ds way :
/* 
Transaction(amount: 69.00, date: DateTime.now(), id: "t1", title: "New Shoes")

And we make all fields required
 */
  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
