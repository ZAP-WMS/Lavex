import 'package:flutter/material.dart';
import 'package:lavex/utils/colors.dart';
import 'package:lavex/view/Authentication/login.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../utils/asset_image.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LocalAssetImage(
          path: 'assets/login/login.png',
          // height: MediaQuery.of(context).size.height * 0.7,
          // width: MediaQuery.of(context).size.width * 0.5,
          color: blackColor,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                alignment: Alignment.center,
                // decoration: BoxDecoration(
                //   border: Border.all(color: appColor),
                // ),
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(50),
                      child: Column(children: [
                        TabBar(
                          labelColor: greyColor,
                          // labelStyle: buttonWhite,
                          unselectedLabelColor: Colors.black,

                          //indicatorSize: TabBarIndicatorSize.label,
                          indicator: MaterialIndicator(
                            horizontalPadding: 24,
                            bottomLeftRadius: 8,
                            bottomRightRadius: 8,
                            color: blackColor,
                            paintingStyle: PaintingStyle.fill,
                          ),

                          tabs: const [
                            Tab(
                              text: "Sign In",
                            ),
                            Tab(
                              text: "Register",
                            ),
                          ],
                        ),
                      ]),
                    ),
                    body: const TabBarView(children: [
                      LoginPage(),
                      LoginPage(),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
