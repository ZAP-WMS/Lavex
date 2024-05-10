import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/utils/colors.dart';
import 'package:lavex/view/Authentication/login.dart';
import 'package:lavex/view/controller/index_controller.dart';
import 'package:lavex/view/homepage/home_page.dart';
import 'package:lavex/widgets/custom_spacebar.dart';

import '../../common/custom_text.dart';
import '../../utils/string.dart';

// class NavBarPage extends StatefulWidget {
//   const NavBarPage({super.key});

//   @override
//   State<NavBarPage> createState() => _NavBarPageState();
// }

class NavBarPage extends GetView<IndexController> {
  List<Widget> pages = [
    HomePage(),
  ];
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: redColor,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    horizontalSpace(10),
                    DropdownButton(
                        value: 'Change Company',
                        items: [
                          DropdownMenuItem(
                            value: 'Change Company',
                            child: CTextWhite('Change Company', mSize: 12),
                          ),
                        ],
                        onChanged: (value) {}),
                    horizontalSpace(25),
                    Row(
                      children: [
                        Icon(Icons.settings, color: whiteColor),
                        horizontalSpace(10),
                        CTextWhite(settingText, mSize: 14),
                        horizontalSpace(10),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 200,
                          height: 60,
                          child: TextField(
                            onChanged: (value) {
                              // Filter data based on the entered value
                            },
                            decoration: const InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    DropdownButton(
                        value: 'Change Language',
                        items: [
                          DropdownMenuItem(
                            value: 'Change Language',
                            child: CTextWhite(adminProfileText, mSize: 12),
                          ),
                        ],
                        onChanged: (value) {}),
                    horizontalSpace(15),
                    CTextWhite(adminProfileText, mSize: 12),
                    horizontalSpace(15),
                    CTextWhite(logoutText, mSize: 12),
                    horizontalSpace(15),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 40,
            color: redColor,
            width: MediaQuery.of(context).size.width * 2,
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              child: ListView.builder(
                itemCount: tabTitles.length,
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
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Icon(Icons.home_max_outlined, color: whiteColor),
                              horizontalSpace(10),
                              CTextWhite(tabTitles[index], mSize: 14)
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          ),
          Obx(() => Expanded(child: pages[controller.currentIndex.value]))
        ],
      ),
    );
  }
}
