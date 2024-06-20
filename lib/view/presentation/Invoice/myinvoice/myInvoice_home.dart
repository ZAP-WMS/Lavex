import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import '../../../../common/custom_text.dart';
import '../../../../utils/asset_image.dart';
import '../../../../utils/colors.dart';
import '../../../../widgets/custom_spacebar.dart';
import '../../../controller/invoice_controller.dart';
import 'myInvoice..dart';

class MyHomeInvoice extends GetView<InvoiceController> {
  const MyHomeInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    final InvoiceController controller = Get.put(InvoiceController());
    final ScrollController scrollController = ScrollController();

    List<String> tabIcon = [
      'assets/create_invoice/pro-forma.png',
      'assets/create_invoice/invoice.png',
      'assets/create_invoice/Debit note.png',
      'assets/create_invoice/credit note.png',
      'assets/create_invoice/delivery challan.png',
      //    'assets/create_invoice/Cash memo.png',
      'assets/create_invoice/invoice setting.png',
      'assets/create_invoice/Delete.png',
    ];
    return CommonScaffold(
      body: Obx(
        () => Column(children: [
          verticalSpace(10),
          SizedBox(
            height: 40,
            child: ListView.builder(
              itemCount: myInvoiceTabTitle.length,
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () {
                        controller.currentIndex.value = index;
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        decoration: BoxDecoration(
                            color: controller.currentIndex.value == index
                                ? appColor
                                : greyColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            LocalAssetImage(
                              path: tabIcon[index],
                              height: 25,
                              width: 25,
                            ),
                            horizontalSpace(10),
                            CTextWhite(myInvoiceTabTitle[index], mSize: 14)
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
          Expanded(
            child: MyInvoiceList(
                pageTitle: createInvoice[controller.currentIndex.value]),
          )
        ]),
      ),
    );
  }
}
