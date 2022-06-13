import 'package:flutter/material.dart';
import 'package:expense_sheet/views/widgets/textField.dart';
import 'package:expense_sheet/utils/colors.dart';
import 'package:get/get.dart';
import 'package:expense_sheet/controllers/transactionController.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final transactionAdd= Get.find<TransactionController>();

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle= titleController.text;
    final enteredAmount =double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount<=0){
      return;
    }
    transactionAdd.addItems(enteredTitle,enteredAmount);
    titleController.clear();
    amountController.clear();
    Navigator.of(context).pop();
  }

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
                borderColor: UiColors.lblBorderClr, cursorColor: UiColors.cursorClr,
              inputType: TextInputType.number, dataSubmit: (_)=>submitData(),),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  const Text("No data chosen!"),
                  TextButton(onPressed: (){},
                      child: const Text("Choose Date",style: TextStyle(color: UiColors.txtBtnClr,fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
            ElevatedButton(onPressed: ()
            {
              submitData();
            },
            style: ElevatedButton.styleFrom(primary: UiColors.btnClr),
                child: const Text("Add Transaction",)
            )
          ],
        ),
      ),
    );
  }
}
