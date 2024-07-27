import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/view/controller/cash_inward_controller.dart';
import 'package:lavex/view/presentation/store/add_production.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import '../../../common/custom_text.dart';
import '../../../routes/route_pages.dart';
import '../../../utils/asset_image.dart';
import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../../../widgets/custom_spacebar.dart';
import 'cash_inward_entry.dart';
import 'inward_entry.dart';

class CashInwardHome extends GetView<CashInwardController> {
  const CashInwardHome({super.key});

  @override
  Widget build(BuildContext context) {
    final CashInwardController controller = Get.put(CashInwardController());
    List<String> tabIcon = [
      'assets/store/inward Entry.png',
      'assets/store/Cash Inward Entry.png',
      'assets/store/Add new production.png'
    ];

    List<Widget> pages = [
      CashInward(),
      InwardEntry(),
      AddProduction(),
    ];
    return CommonScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 2.0,
                  runSpacing: 0.0,
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.currentIndex.value = index;
                          Get.toNamed(AppRoutes.cashInwardHome);
                        },
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                              color: controller.currentIndex.value == index
                                  ? appColor
                                  : whiteColor,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: greyColor)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LocalAssetImage(
                                  path: tabIcon[index], height: 25, width: 25),
                              horizontalSpace(5),
                              controller.currentIndex.value == index
                                  ? CTextWhite(storeTabName[index], mSize: 14)
                                  : CTextBlack(storeTabName[index], mSize: 14)
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Divider(color: greyColor),
                verticalSpace(20),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
