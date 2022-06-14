import 'package:date_field/date_field.dart';
import 'package:expense_sheet/views/widgets/datePicker.dart';
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

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
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
                  Text("No Date Choosen"),
                  Expanded(
                    child: DateFormFieldContainer(
                      isRounded: false,
                      isTrue: true,
                      // enable: _.paymentvalue == 'Cheque' ? true : false,
                      text: '',
                      mode: DateTimeFieldPickerMode.date,
                      dateFormatTrue: true,
                      initialValue: DateTime.now(),
                      onDateSelected: (value) {
                        transactionAdd.date = value;
                        transactionAdd.update();
                      },
                    ),
                  ),
                //   TextButton(onPressed: (){
                //     // transactionAdd.presentDatePicker();
                //
                //   },
                //       child: const Text("Choose Date",style: TextStyle(color: UiColors.txtBtnClr,fontWeight: FontWeight.bold),)),
                //
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
      ),
    );
  }
}
