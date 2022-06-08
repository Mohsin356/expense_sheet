import 'package:get/get.dart';
import 'package:expense_sheet/models/transactionModel.dart';

class TransactionController extends GetxController{
  var transactionsList = <Transaction>[].obs;

  @override
  onInit(){
    super.onInit();
    fetchListItems();
  }
  void fetchListItems(){
    var response =<Transaction>[
      Transaction(id: "t1",title: "Lunch",amount: 200, date: DateTime.now()),
      Transaction(id: "t2",title: "Breakfast",amount: 300, date: DateTime.now()),
    ];
    transactionsList.value=response;
  }
}