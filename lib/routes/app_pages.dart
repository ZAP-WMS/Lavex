import 'package:get/route_manager.dart';
import 'package:lavex/data/model/add_suppllier.dart';
import 'package:lavex/routes/route_pages.dart';
import 'package:lavex/view/Authentication/login.dart';
import 'package:lavex/view/Authentication/register.dart';
import 'package:lavex/view/presentation/Companey/update_company.dart';
import 'package:lavex/view/presentation/clients/add_client.dart';
import 'package:lavex/view/presentation/edit/edit_table.dart';
import 'package:lavex/view/presentation/homepage/home_page.dart';
import 'package:lavex/view/presentation/homepage/menu_page.dart';
import 'package:lavex/view/presentation/payments/add_suppllier.dart';
import 'package:lavex/view/presentation/store/add_production.dart';
import 'package:lavex/view/presentation/store/cash_inward_home.dart';
import 'package:lavex/view/presentation/store/stocks.dart';
import 'package:lavex/view/presentation/store/store.dart';
import '../view/Authentication/navbar_page.dart';
import '../view/binding/Bombinding.dart';
import '../view/binding/create_invoice_binding.dart';
import '../view/binding/index_binding.dart';
import '../view/binding/proma_form_binding.dart';
import '../view/presentation/BOM/bom_add_item.dart';
import '../view/presentation/BOM/detailBom.dart';
import '../view/presentation/BOM/edit_bom.dart';
import '../view/presentation/Companey/Managecompaney.dart';
import '../view/presentation/Companey/add_company.dart';
import '../view/presentation/Invoice/createinvoice/create_invoiceList.dart';
import '../view/presentation/Invoice/createinvoice/create_invoice.dart';
import '../view/presentation/Invoice/createinvoice/pro_forma.dart';
import '../view/presentation/Invoice/myinvoice/myInvoice_home.dart';
import '../view/presentation/Invoice/myinvoice/myInvoice..dart';
import '../view/presentation/ItemMaster/item_master.dart';
import '../view/presentation/clients/my_clients.dart';
import '../view/presentation/store/add_item.dart';
import '../view/presentation/store/updateInward.dart';
import '../view/presentation/store/viewBill.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.home, page: () => const HomePage(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.client_List, page: () => MyClient(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.menuBar,
      page: () => MenuPage(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.itemmaster,
      page: () => ItemMaster(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.managecompaney,
      page: () => MyCompaney(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.addcompaney,
      page: () => AddCompaney(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.editBom,
      page: () => EditBomItem(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.update_companey,
      page: () => UpdateCompaney(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.viewBilldetail,
      page: () => ProductBillScreen(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.detailBom,
      page: () => DetailBom(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.bomAdditem,
      page: () => BomAddItem(),
      binding: BomBinding(),
    ),
    GetPage(
      name: AppRoutes.addproduction,
      page: () => AddProduction(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.updateinward,
      page: () => UpdateInward(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterPage(),
      //   binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.navBarPage,
      page: () => NavBarPage(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: AppRoutes.createInvoice,
      page: () => CreateInvoice(),
      binding: CreateInvoiceBinding(),
    ),
    GetPage(
        name: AppRoutes.proForma,
        page: () => PromaForm(),
        binding: PromaFormBinding()),
    GetPage(
      name: AppRoutes.myHomeInvoice,
      page: () => const MyHomeInvoice(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.myInvoice,
      page: () => MyInvoiceList(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.createInvoiceList,
      page: () => const CreateInvoiceList(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.storePage,
      page: () => StorePage(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.cashInwardHome,
      page: () => const CashInwardHome(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.stockPage,
      page: () => StockPage(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.addItem,
      page: () => AddItem(),
      //  binding: PromaFormBinding()
    ),
    GetPage(
      name: AppRoutes.editPage,
      page: () => EditTable(),
    ),
    GetPage(
      name: AppRoutes.addClient,
      page: () => AddClient(),
    ),
    GetPage(
      name: AppRoutes.addSuppllier,
      page: () => SuppllierPage(),
    ),
  ];
}
