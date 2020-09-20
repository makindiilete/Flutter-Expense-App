import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  //A list variable to hold our transaction, we will map ds variable later
  final List<Transaction> userTransactions;
//A function to remove a selected transaction by its id
  final Function removeTransaction;
  //A constructor that receives d transaction we passed to this widget and
  // set the value receives to our declared variable above
  TransactionList({@required this.userTransactions, this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: userTransactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      "No transactions added yet",
                      style: Theme.of(context).textTheme.title,
                    ),
                    //We use the SizedBox widget to add space between 2 widgets
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.7,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
//                  height: 200,
                    )
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: userTransactions
                  .length, //d itemCount is required for the ListView builder to know how many times the itemBuilder function will be called
              // the itemBuilder will call the function passed to it for every item in the list
              itemBuilder: (context, index) {
                return new TransactionItem(
                  removeTransaction: removeTransaction,
                  userTransaction: userTransactions[index],
                );
              },
            ),
    );
  }
}
