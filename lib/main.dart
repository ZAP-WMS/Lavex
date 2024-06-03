import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/routes/app_pages.dart';
import 'package:lavex/routes/route_pages.dart';
import 'package:lavex/utils/colors.dart';
import 'package:lavex/view/Authentication/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.list,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        // textTheme:
        //     DeviceInfo.deviceWidth() < 500 ? smallTextTheme : defaultTextTheme,
        // body = monstera
        // heading = playfair display
        fontFamily: "Monstserrat",
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
          // Define your desired input field style here
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(color: appColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(color: appColor),
          ),
        ),
      ),
      // home: ProfilePage(),
    );
  }
}
