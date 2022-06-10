import 'package:expense_sheet/views/widgets/newTransaction.dart';
import 'package:flutter/material.dart';
import 'package:expense_sheet/utils/colors.dart';
import 'package:expense_sheet/views/widgets/transactionList.dart';
import 'package:get/get.dart';
import 'package:expense_sheet/controllers/transactionController.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final transactions = Get.put(TransactionController());
  void startNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return NewTransaction();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Expense Planner'),
        backgroundColor: UiColors.appBarClr,
        actions: [
          IconButton(onPressed: (){
            startNewTransaction(context);
          }, icon: const Icon(Icons.add))
        ],),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
               const Card(
                child: Text("Chart"),
              ),
               TransactionList(transaction: transactions.transactionsList),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: UiColors.floatingBtnClr,
          child: const Icon(Icons.add),
          onPressed: (){startNewTransaction(context);},
        ),
      ),
    );
  }
}
