import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/chartController.dart';
import '../../utils/colors.dart';
class Chart extends StatelessWidget {
   Chart({Key? key}) : super(key: key);
  final chartOfTransactions = Get.put(ChartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
        elevation: 6,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: chartOfTransactions.groupedTransactionValues.map(
                    (data) =>Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      const SizedBox(
                          height: 20,
                          child: FittedBox(child: Text('Rs'))),
                      const SizedBox(height: 4,),SizedBox(
                          height: 20,
                          child: FittedBox(child: Text((data['amount'] as double).toStringAsFixed(0)))),
                      const SizedBox(height: 4,),
                      SizedBox(
                        height: 60,
                        width: 10,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: UiColors.fillerBorderClr,width: 1),
                                color: UiColors.emptyFillerClr,
                                borderRadius: BorderRadius.circular(10),
                              ),),
                            FractionallySizedBox(
                              heightFactor: data['spending'] == 0 ? 0 :(data['amount'] as double)/(data['spending']as double),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: UiColors.fillerClr,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Text('${data['day']}'),
                    ],
                  ),
                ) ).toList(),
          ),
        )
    ));
  }
}
