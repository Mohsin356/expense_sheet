import 'package:get/get.dart';
import 'package:expense_sheet/models/transactionModel.dart';

class TransactionController extends GetxController{
  var transactionsList = <Transaction>[].obs;
  @override
  onInit(){
    super.onInit();
    transactionsList;
  }
  addItems(String txTitle, double txAmount){
    final newTx = Transaction(id: DateTime.now().toString(),title: txTitle,amount: txAmount,date: DateTime.now());
    transactionsList.add(newTx);
  }

}