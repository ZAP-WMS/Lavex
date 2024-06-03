import 'package:get/get.dart';
import 'package:lavex/data/model/cart_item.dart';

class InvoiceController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int newIndex) {
    currentIndex.value = newIndex;
  }

  var cartItems = <CartItem>[].obs;

  void addItem(CartItem item) {
    cartItems.add(item);
  }
}
