import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:expense_sheet/utils/colors.dart';
import 'package:expense_sheet/models/transactionModel.dart';
class TransactionList extends StatelessWidget {
  const TransactionList({Key? key,required this.transaction}) : super(key: key);
  final List<Transaction> transaction;
  @override
  Widget build(BuildContext context) {
    return Obx(() => transaction.isEmpty ? Column(
      children: [
        const Text("No transactions added yet",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        const SizedBox(height: 20,),
        SizedBox(
            height: 200,
            child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,))
      ],
    ):Column(
      children:
      transaction.map((tx){
        return Card(
            elevation: 5,
            child: Row(
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(vertical:10,horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: UiColors.priceBorderClr,width: 2)
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text("${tx.amount!.toStringAsFixed(2)} Rs",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                            color: UiColors.priceTxtXlr))
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tx.title.toString(),
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
                    Text(DateFormat.yMMMd().format(tx.date!),
                        style: const TextStyle(color: UiColors.dateTxtXlr)),
                  ],
                )
              ],
            )
        );
      }).toList(),
    )
    );
  }
}
