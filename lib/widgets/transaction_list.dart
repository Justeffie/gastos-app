import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gastos_app/widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No transactions added yet',
                    style: ThemeData.light().textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (context, index) {
                return TransactionItem(
                    transaction: transactions[index], deleteTx: deleteTx);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
