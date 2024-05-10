import 'package:get/route_manager.dart';
import 'package:lavex/routes/route_pages.dart';
import 'package:lavex/view/Authentication/login.dart';
import 'package:lavex/view/Authentication/login_register.dart';

import '../view/Authentication/navbar_page.dart';
import '../view/binding/index_binding.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN_REGISTER,
      page: () => const LoginRegister(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.NavBar_Page,
      page: () => NavBarPage(),
      binding: NavBarBinding(),
    ),
  ];
}
