import 'package:get/get.dart';
import 'package:expense_sheet/models/transactionModel.dart';
import 'package:flutter/material.dart';
import 'package:expense_sheet/views/widgets/newTransaction.dart';

class TransactionController extends GetxController{
  var transactionsList = <Transaction>[].obs;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  var selectedDate= DateTime.now().obs;
  @override
  onInit(){
    super.onInit();
    transactionsList;
  }
  addItems(String txTitle, double txAmount){
    final newTx = Transaction(id: DateTime.now().toString(),title: txTitle,amount: txAmount,date: DateTime.now());
    transactionsList.add(newTx);
  }
  submitData(){
    if(amountController.text.isEmpty){
      return;
    }
    final enteredTitle= titleController.text;
    final enteredAmount =double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount<=0){
      return;
    }
    addItems(enteredTitle,enteredAmount);
    titleController.clear();
    amountController.clear();
    Navigator.of(Get.context!).pop();
  }
  startNewTransaction(){
    showModalBottomSheet(context: Get.context!,
        isScrollControlled: true,
        builder: (_){
      return const NewTransaction();
    });
  }
  presentDatePicker(){
    showDatePicker(context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2022),
        lastDate: DateTime.now()
    ).then((pickedDate){
      if (pickedDate==null){
        return;
      }
      selectedDate.value =pickedDate;
    });

  }
}