import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/routes/route_pages.dart';
import 'package:lavex/utils/asset_image.dart';
import 'package:lavex/utils/colors.dart';
import 'package:lavex/utils/custom_text.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import 'package:lavex/widgets/rich_text.dart';

import '../../utils/style.dart';
import '../../widgets/cutom_textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController gmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LocalAssetImage(
            path: 'assets/login/login.png',
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.4,
            color: blackColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: RichTextWidget(
                        title: newUser,
                        subtitle: signUp,
                        titlestyle: normalTextStyle,
                        subtitleStyle: normalappcolorTextStyle),
                  ),
                  CTextWhite(
                    welcomeText,
                    textStyle: boldTextStyle,
                  ),
                  CTextWhite(
                    loginText,
                    textStyle: normalTextStyle,
                  ),
                  verticalSpace(30),
                  CustomTextFormField(
                    controller: gmailController,
                    name: 'Enter Email Id',
                    style: normalTextStyle,
                    // width: 700,
                    isSuffixIcon: false,
                    isreadOnly: false,
                    icon: Icon(Icons.email_outlined),
                    validator: (p0) {},
                  ),
                  verticalSpace(15),
                  CustomTextFormField(
                    controller: passwordController,
                    name: 'Enter Password',
                    style: normalTextStyle,
                    // width: 700,
                    isSuffixIcon: false,
                    isreadOnly: false,
                    icon: const Icon(Icons.lock_clock_outlined),
                    validator: (p0) {},
                  ),
                  verticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          width: MediaQuery.of(context).size.width * 0.1,
                          text: 'LOGIN',
                          onPressed: () {
                            Get.toNamed(AppRoutes.NavBar_Page);
                          }),
                      CTextWhite(
                        forgetText,
                        textStyle: normalTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
