import 'package:get/get.dart';
import 'package:lavex/view/controller/cartItem_controller.dart';
import 'package:lavex/view/controller/index_controller.dart';
import 'package:lavex/view/controller/invoice_controller.dart';

void bindingIndexController() =>
    Get.lazyPut<IndexController>(() => IndexController());

void bindingInvoiceController() =>
    Get.lazyPut<InvoiceController>(() => InvoiceController());

void bindingCartController() =>
    Get.lazyPut<CartController>(() => CartController());
