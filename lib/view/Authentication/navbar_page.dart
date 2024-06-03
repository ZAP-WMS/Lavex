import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/utils/colors.dart';

import 'package:lavex/view/controller/index_controller.dart';
import 'package:lavex/view/presentation/clients/my_clients.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import '../../common/custom_text.dart';
import '../../utils/asset_image.dart';
import '../../utils/string.dart';
import '../presentation/Invoice/createinvoice/create_invoiceList.dart';
import '../presentation/Invoice/myinvoice/my_invoiceTabList.dart';
import '../presentation/homepage/home_page.dart';
import '../presentation/payments/cash_memo_payments.dart';
import '../presentation/payments/my_payments.dart';
import '../presentation/payments/my_supplier_payment.dart';

class NavBarPage extends GetView<IndexController> {
  List<Widget> pages = [
    HomePage(),
    const CreateInvoiceList(),
    const MyInvoiceTabList(),
    MyClient(),
    MySupplierPayment(),
    // MyPayments(),
    CashMemoPayments(),
  ];
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Row(children: [
              Container(
                alignment: Alignment.topRight,
                height: MediaQuery.of(context).size.height,
                width: 240,
                child: ListView.builder(
                  itemCount: tabTitles.length,
                  scrollDirection: Axis.vertical,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    // print(controller.currentIndex.value);
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ExpansionTile(
                        key: PageStorageKey<int>(index),
                        onExpansionChanged: (value) {
                          if (value) {
                            controller.currentIndex.value = index;
                          }
                        },
                        initiallyExpanded: false,
                        // collapsedBackgroundColor: appColor,
                        // collapsedTextColor: whiteColor,
                        textColor: redColor,
                        leading: LocalAssetImage(
                            path: menubarIcons[index], height: 25),
                        title:
                            // controller.currentIndex.value == index
                            //     ? CTextWhite(tabTitles[index], mSize: 14)
                            //     :
                            CTextRed(tabTitles[index], mSize: 14),
                        children: [
                          if (index == 1)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      controller.currentIndex.value = 1;
                                    },
                                    child: CTextRed(invoicesubTitles[0],
                                        mSize: 14)),
                                verticalSpace(10),
                                GestureDetector(
                                    onTap: () {
                                      controller.currentIndex.value = 2;
                                    },
                                    child: CTextRed(invoicesubTitles[1],
                                        mSize: 14)),
                                verticalSpace(10),
                                CTextRed(invoicesubTitles[2], mSize: 14),
                                verticalSpace(10),
                              ],
                            ),
                          if (index == 2)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      controller.currentIndex.value = 3;
                                    },
                                    child: CTextRed(paymentssubTitles[0],
                                        mSize: 14)),
                                verticalSpace(10),
                                GestureDetector(
                                    onTap: () {
                                      controller.currentIndex.value = 4;
                                    },
                                    child: CTextRed(paymentssubTitles[1],
                                        mSize: 14)),
                                verticalSpace(10),
                                GestureDetector(
                                    onTap: () {
                                      controller.currentIndex.value = 5;
                                    },
                                    child: CTextRed(paymentssubTitles[2],
                                        mSize: 14)),
                                verticalSpace(10),
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              VerticalDivider(
                color: redColor,
                thickness: 2,
              ),
              Expanded(
                  child: IndexedStack(
                index: controller.currentIndex.value,
                children: pages.map((page) {
                  return Navigator(
                    key: PageStorageKey<String>(page.toString()),
                    onGenerateRoute: (settings) {
                      return MaterialPageRoute(
                        builder: (context) => page,
                      );
                    },
                  );
                }).toList(),
              ))
            ])));
  }
}
