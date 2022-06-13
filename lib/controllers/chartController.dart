import 'package:expense_sheet/controllers/transactionController.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class ChartController extends GetxController{
  final recentTransaction =Get.find<TransactionController>();
 List<Map<String, Object>> get groupedTransactionValues{
      return List.generate(7, (index) {
        final weekDay= DateTime.now().subtract(Duration(days: index));
        var totalSum=0.0;
        for(var i=0;i< recentTransaction.transactionsList.length;i++){
          if(recentTransaction.transactionsList[i].date!.day == weekDay.day &&
          recentTransaction.transactionsList[i].date!.month == weekDay.month &&
          recentTransaction.transactionsList[i].date!.year == weekDay.year)
          {
            totalSum += recentTransaction.transactionsList[i].amount!;
          }
        }
        var totalSpendings=0.0;
        for(var j=0;j< recentTransaction.transactionsList.length;j++){
          {
            totalSpendings += recentTransaction.transactionsList[j].amount!;
          }
        }
     return {'day':DateFormat.E().format(weekDay).substring(0,3),'amount':totalSum,'spending':totalSpendings};}).reversed.toList();
}
}