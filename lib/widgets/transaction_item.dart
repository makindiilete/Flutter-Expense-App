import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    @required this.userTransaction,
    @required this.removeTransaction,
  });

  final Transaction userTransaction;
  final Function removeTransaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: FittedBox(child: Text("\$${userTransaction.amount}")),
            ),
          ),
          title: Text(
            userTransaction.title,
            style: Theme.of(context).textTheme.title,
          ),
          subtitle: Text(DateFormat.yMMMd().format(userTransaction.date)),
          //ds button will av an icon which will appear on d far right and onPress call a fn to remove the transaction
          trailing: MediaQuery.of(context).size.width > 460
              ? FlatButton.icon(
                  onPressed: () {
                    removeTransaction(userTransaction.id);
                  },
                  textColor: Theme.of(context).errorColor,
                  icon: Icon(
                    Icons.delete,
                  ),
                  label: Text("Delete"))
              : IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () {
                    removeTransaction(userTransaction.id);
                  },
                ),
        ),
      ),
    );
  }
}
