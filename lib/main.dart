import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/routes/app_pages.dart';
import 'package:lavex/routes/route_pages.dart';
import 'package:lavex/utils/colors.dart';
import 'view/controller/company_controller.dart';
import 'view/controller/loading_controller.dart';
import 'widgets/Loading_file.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final CompanyController companyController = Get.put(CompanyController());
  final _loader = Get.put(LoadingController());

  MaterialColor createMaterialColor(Color color) {
    List<double> strengths = <double>[.05];
    final Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    print(_loader.isLoading);
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.menuBar,
        getPages: AppPages.list,
        themeMode: ThemeMode.system,
        builder: (context, child) {
          return Stack(
            children: [
              Obx(() {
                return Opacity(
                    opacity: (_loader.isLoading == true) ? .5 : 1,
                    child: child!);
              }),

              Obx(() {
                return _loader.isLoading.value
                    ? const LoadingFile()
                    : SizedBox.shrink();
              }), // Ensure this is part of the widget tree
            ],
          );
        },
        theme: ThemeData(
          fontFamily: "Monstserrat",
          primaryColor: redColor,
          primarySwatch: createMaterialColor(companyController.bgColor.value),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
            // Define your desired input field style here
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
              borderSide: BorderSide(color: companyController.bgColor.value),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
              borderSide: BorderSide(color: companyController.bgColor.value),
            ),
          ),
        ),
      );
    });
  }
}
