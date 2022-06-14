import 'package:expense_sheet/controllers/transactionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:expense_sheet/utils/colors.dart';
class TransactionList extends StatelessWidget {
   TransactionList({Key? key,}) : super(key: key);
  final transactionList = Get.find<TransactionController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => transactionList.transactionsList.isEmpty ? Column(
      children: [
        const Text("No Transactions Added Yet",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: UiColors.headingTxtClr)),
        const SizedBox(height: 20,),
        SizedBox(
            height: 200,
            child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,))
      ],
    )
        :Column(
      children: [
        const Text("Expense List",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: UiColors.headingTxtClr)),
        const SizedBox(height: 15,),
        ListView.separated(
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: transactionList.transactionsList.length,
            itemBuilder: (context,index){
              return ListTile(
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transactionList.transactionsList[index].title.toString(),
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                      const SizedBox(height: 8,),
                      Text(DateFormat.yMMMd().format(transactionList.transactionsList[index].date!),
                          style: const TextStyle(color: UiColors.dateTxtXlr)),
                    ],
                  ),
                trailing:  Text("Rs ${transactionList.transactionsList[index].amount!.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                        color: UiColors.priceTxtXlr)),
              );
            })
      ],
    )
    );
  }
}
