import 'package:flutter/material.dart';
import 'package:expense_sheet/views/widgets/textField.dart';
import 'package:expense_sheet/utils/colors.dart';
import 'package:get/get.dart';
import 'package:expense_sheet/controllers/transactionController.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final transactionAdd= Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFields(controller: transactionAdd.titleController,lblText: 'Title', lblTxtClr: UiColors.lblTxtClr,
                    borderColor: UiColors.lblBorderClr, cursorColor: UiColors.cursorClr),
                TextFields(controller:transactionAdd.amountController,lblText: 'Amount', lblTxtClr: UiColors.lblTxtClr,
                  borderColor: UiColors.lblBorderClr, cursorColor: UiColors.cursorClr,
                  inputType: TextInputType.number, dataSubmit: (_){
                    return {transactionAdd.submitData(),
                      Navigator.of(context).pop()
                    };
                  },),
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      const Text("Picked Date:",style: TextStyle(color: UiColors.lblTxtClr,fontSize: 16),),
                      const SizedBox(width: 8,),
                      Obx(() => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: UiColors.boxBorderClr,width: 2),
                          ),
                          child: Text(DateFormat.yMMMd().format(transactionAdd.selectedDate.value)))),
                      TextButton(onPressed: (){
                        transactionAdd.presentDatePicker();
                      },
                          child: const Icon(Icons.calendar_month_sharp)),
                    ],
                  ),
                ),
                ElevatedButton(onPressed: (){
                  transactionAdd.submitData();
                },
                    style: ElevatedButton.styleFrom(primary: UiColors.btnClr),
                    child: const Text("Add Transaction",)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
