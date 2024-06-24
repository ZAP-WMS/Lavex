import 'package:get/route_manager.dart';
import 'package:lavex/routes/route_pages.dart';
import 'package:lavex/view/Authentication/login.dart';
import 'package:lavex/view/Authentication/register.dart';
import 'package:lavex/view/presentation/edit/edit_table.dart';
import 'package:lavex/view/presentation/homepage/home_page.dart';
import 'package:lavex/view/presentation/homepage/menu_page.dart';
import 'package:lavex/view/presentation/store/cash_inward_home.dart';
import 'package:lavex/view/presentation/store/stocks.dart';
import 'package:lavex/view/presentation/store/store.dart';
import '../view/Authentication/navbar_page.dart';
import '../view/binding/create_invoice_binding.dart';
import '../view/binding/index_binding.dart';
import '../view/binding/proma_form_binding.dart';
import '../view/presentation/Invoice/createinvoice/create_invoiceList.dart';
import '../view/presentation/Invoice/createinvoice/create_invoice.dart';
import '../view/presentation/Invoice/createinvoice/pro_forma.dart';
import '../view/presentation/Invoice/myinvoice/myInvoice_home.dart';
import '../view/presentation/Invoice/myinvoice/myInvoice..dart';
import '../view/presentation/store/add_item.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.Home, page: () => const HomePage(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.Menu_bar,
      page: () => const MenuPage(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterPage(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.NavBar_Page,
      page: () => NavBarPage(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: AppRoutes.CREATE_INVOICE,
      page: () => CreateInvoice(),
      binding: CreateInvoiceBinding(),
    ),
    GetPage(
        name: AppRoutes.PROMA_FORM,
        page: () => PromaForm(),
        binding: PromaFormBinding()),
    GetPage(
      name: AppRoutes.MY_HOME_INVOICE,
      page: () => const MyHomeInvoice(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.MY_INVOICE,
      page: () => MyInvoiceList(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.CREATE_INVOICE_LIST,
      page: () => const CreateInvoiceList(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.STORE_PAGE,
      page: () => StorePage(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.Cash_Inward_home,
      page: () => const CashInwardHome(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.Stock_Page,
      page: () => StockPage(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.Add_Item,
      page: () => AddItem(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.Edit_Page,
      page: () => EditTable(),
    ),
  ];
}
