import 'package:expense_sheet/views/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:expense_sheet/utils/colors.dart';
import 'package:expense_sheet/views/widgets/transactionList.dart';
import 'package:get/get.dart';
import 'package:expense_sheet/controllers/transactionController.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final transactions = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Expense Tracker'),
        backgroundColor: UiColors.appBarClr,
        actions: [
          IconButton(onPressed: (){
            transactions.startNewTransaction();
          }, icon: const Icon(Icons.add))
        ],),
        body: SingleChildScrollView(
          child: Column(
            children:  [
             const Padding(
                padding:  EdgeInsets.all(10.0),
                child: Text("Last Week Expenses",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: UiColors.headingTxtClr)),
              ),
                Chart(),
               TransactionList(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: UiColors.floatingBtnClr,
          child: const Icon(Icons.add),
          onPressed: (){transactions.startNewTransaction();},
        ),
      ),
    );
  }
}
