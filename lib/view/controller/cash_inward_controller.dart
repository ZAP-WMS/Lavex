import 'package:get/get.dart';
import '../../data/model/cart_item.dart';

class CashInwardController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var currentIndex = 0.obs;
  var grandtotal = 0.0.obs;

  void gettotal() {
    grandtotal.value = cartItems.fold(
        0.0, (previousValue, element) => previousValue + element.total);
  }

  void changeIndex(int newIndex) {
    currentIndex.value = newIndex;
  }

  void addItem(CartItem item) {
    cartItems.add(item);
  }


    void removeItem(CartItem item) {
    cartItems.remove(item);
  }
}
