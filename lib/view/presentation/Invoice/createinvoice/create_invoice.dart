import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/utils/asset_image.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/view/presentation/Invoice/createinvoice/pro_forma.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import '../../../../common/custom_text.dart';
import '../../../../utils/colors.dart';
import '../../../../widgets/custom_spacebar.dart';
import '../../../controller/invoice_controller.dart';

class CreateInvoice extends GetView<InvoiceController> {
  @override
  Widget build(BuildContext context) {
    final InvoiceController controller = Get.put(InvoiceController());
    final ScrollController scrollController = ScrollController();
    List<Widget> invoicePages = [
      PromaForm(pageTitle: createInvoice[1]),
      PromaForm(pageTitle: createInvoice[2]),
      PromaForm(pageTitle: createInvoice[3])
    ];
    List<String> tabIcon = [
      //  'assets/create_invoice/invoice setting.png',
      'assets/create_invoice/pro-forma.png',
      'assets/create_invoice/invoice.png',
      'assets/create_invoice/Debit note.png',
      'assets/create_invoice/credit note.png',
      'assets/create_invoice/delivery challan.png',
  //    'assets/create_invoice/Cash memo.png',
    ];
    return CommonScaffold(
      body: Obx(
        () => Column(children: [
          verticalSpace(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: createInvoice.length,
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(5.0),
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
                              CTextWhite(createInvoice[index], mSize: 14)
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          ),
          Expanded(
            child: PromaForm(
                pageTitle: createInvoice[controller.currentIndex.value]),
          )
        ]),
      ),
    );
  }
}
