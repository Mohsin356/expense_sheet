import 'package:expense_sheet/controllers/transactionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:expense_sheet/utils/colors.dart';
class TransactionList extends StatelessWidget {
   TransactionList({Key? key,}) : super(key: key);
  final transaction = Get.find<TransactionController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => transaction.transactionsList.isEmpty ? Column(
      children: [
        const Text("No Expenses Added Yet",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: UiColors.headingTxtClr)),
        const SizedBox(height: 15,),
        SizedBox(
            height: 200,
            child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,))
      ],
    )
        :Column(
      children: [
        const Text("Expenses List",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: UiColors.headingTxtClr)),
        const SizedBox(height: 15,),
        ListView.separated(
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            // scrollDirection: Axis.vertical,
            itemCount: transaction.transactionsList.length,
            itemBuilder: (context,index){
              return ListTile(
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transaction.transactionsList[index].title.toString(),
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                      const SizedBox(height: 8,),
                      Text(DateFormat.yMMMd().format(transaction.transactionsList[index].date!),
                          style: const TextStyle(color: UiColors.dateTxtXlr)),
                    ],
                  ),
                title: Center(
                  child: Text("Rs ${transaction.transactionsList[index].amount!.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                          color: UiColors.priceTxtXlr)),
                ),
                trailing:
                 IconButton(onPressed: (){transaction.deleteItems(transaction.transactionsList[index].id!);}, icon: const Icon(Icons.delete,color: UiColors.deleteIconClr,)),
              );
            })
      ],
    )
    );
  }
}
