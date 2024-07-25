import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/widgets/custom_button.dart';
import '../common/custom_text.dart';
import '../utils/colors.dart';
import '../view/controller/company_controller.dart';
import 'custom_spacebar.dart';

class CommonScaffold extends GetView<CompanyController> {
  final Widget body;
  final String? pageName;

  CommonScaffold({super.key, required this.body, this.pageName});
  final CompanyController controller = Get.put(CompanyController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            elevation: 5,
            backgroundColor: controller.bgColor.value,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    horizontalSpace(10),
                    Obx(() {
                      if (controller.companyList.isEmpty) {
                        return const CircularProgressIndicator();
                      }
                      return DropdownButton<String>(
                        value: controller.selectedCompany.value.isEmpty
                            ? null
                            : controller.selectedCompany.value,
                        hint: CTextWhite('Change Company',
                            mBold: true, mSize: 15),
                        items: controller.companyList.map((String company) {
                          return DropdownMenuItem<String>(
                              value: company,
                              child: company != "Create companey"
                                  ? Text(company,
                                      style: TextStyle(color: blackColor))
                                  : Expanded(
                                      child: CustomButton(
                                          text: "Manage Companey",
                                          fontsie: 10,
                                          onPressed: () =>
                                              {Get.toNamed("/managecompaney")}),
                                    ));
                        }).toList(),
                        selectedItemBuilder: (BuildContext context) {
                          return controller.companyList.map((String company) {
                            return Center(
                                child: CTextWhite(company,
                                    mBold: true, mSize: 15));
                          }).toList();
                        },
                        onChanged: (String? value) {
                          if (value != null) {
                            if (value == "Create Company") {
                            } else {
                              controller.data = controller.changeCompany(value);
                              print(controller.data.name);
                            }
                          }
                        },
                      );
                    }),
                    horizontalSpace(25),
                    Row(
                      children: [
                        horizontalSpace(10),
                        CTextWhite(pageName ?? '', mBold: true, mSize: 15)
                        // Container(
                        //   padding: const EdgeInsets.all(10),
                        //   width: 200,
                        //   height: 60,
                        //   child: TextField(
                        //     onChanged: (value) {
                        //       // Filter data based on the entered value
                        //     },
                        //     decoration: InputDecoration(
                        //       border: OutlineInputBorder(
                        //         borderSide: BorderSide(color: whiteColor),
                        //         borderRadius: BorderRadius.circular(5),
                        //       ),
                        //       hintText: 'Search...',
                        //       hintStyle: TextStyle(color: whiteColor),
                        //       prefixIcon: Icon(Icons.search, color: whiteColor),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 250,
                      height: 60,
                      child: TextField(
                        onChanged: (value) {
                          // Filter data based on the entered value
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: whiteColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: whiteColor),
                          prefixIcon: Icon(Icons.search, color: whiteColor),
                        ),
                      ),
                    ),
                    DropdownButton(
                        value: 'Change Language',
                        items: [
                          DropdownMenuItem(
                            value: 'Change Language',
                            child: CTextWhite('Change Language', mSize: 12),
                          ),
                        ],
                        onChanged: (value) {}),
                    horizontalSpace(10),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person,
                            size: 20, weight: 10, color: whiteColor)),
                    horizontalSpace(10),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings,
                            size: 20, weight: 10, color: whiteColor)),
                    horizontalSpace(10),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.power_settings_new_outlined,
                            size: 20, weight: 10, color: whiteColor)),
                  ],
                )
              ],
            ),
          ),
          body: body,
        ));
  }
}
