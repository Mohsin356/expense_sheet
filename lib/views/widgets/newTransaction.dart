import 'package:flutter/material.dart';
import 'package:expense_sheet/views/widgets/textField.dart';
import 'package:expense_sheet/utils/colors.dart';
import 'package:get/get.dart';
import 'package:expense_sheet/controllers/transactionController.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key}) : super(key: key);
  final transactionAdd= Get.find<TransactionController>();
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFields(controller: titleController,lblText: 'Title', lblTxtClr: UiColors.lblTxtClr,
                borderColor: UiColors.lblBorderClr, cursorColor: UiColors.cursorClr),
            TextFields(controller:amountController,lblText: 'Amount', lblTxtClr: UiColors.lblTxtClr,
                borderColor: UiColors.lblBorderClr, cursorColor: UiColors.cursorClr),
            TextButton(
                onPressed: ()
                {
                  transactionAdd.addItems(titleController.text, double.parse(amountController.text));
                  titleController.clear();
                  amountController.clear();
                },
                child: const Text("Add Transaction",style: TextStyle(color: UiColors.txtBtnClr),) )
          ],
        ),
      ),
    );
  }
}
