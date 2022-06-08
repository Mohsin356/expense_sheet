import 'package:expense_sheet/controllers/transactionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_sheet/utils/colors.dart';

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
                     child: Row(
                       children: [
                         Container(
                           margin: const EdgeInsets.symmetric(vertical:10,horizontal: 15),
                           decoration: BoxDecoration(
                             border: Border.all(color: UiColors.priceBorderClr,width: 2)
                           ),
                           padding: const EdgeInsets.all(10),
                           child: Text("${tx.amount.toString()} Rs")),
                         Column(
                           children: [
                             Text(tx.title.toString()),
                             Text(tx.date.toString()),
                           ],
                         )
                       ],
                     )
                   );
                 }).toList(),
             )
          ],
        ),
      ),

    );
  }
}
