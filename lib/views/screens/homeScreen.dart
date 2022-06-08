import 'package:expense_sheet/controllers/transactionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  final transactions = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Expense Planner')),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
             const Card(
              child: Text("Chart"),
            ),
             Column(
               children:
                 transactions.transactionsList.map((tx){
                   return Card(
                     elevation: 5,
                     child: Text(tx.title!),
                   );
                 }).toList(),
             )
          ],
        ),
      ),

    );
  }
}
