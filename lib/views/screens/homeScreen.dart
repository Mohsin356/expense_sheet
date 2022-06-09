import 'package:expense_sheet/views/widgets/newTransaction.dart';
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
        appBar: AppBar(title: const Center(child: Text('Expense Planner')),
        backgroundColor: UiColors.appBarClr,),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
               const Card(
                child: Text("Chart"),
              ),
               NewTransaction(),
               TransactionList(transaction: transactions.transactionsList),
            ],
          ),
        ),
      ),
    );
  }
}
