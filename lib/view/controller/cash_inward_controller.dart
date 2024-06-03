import 'package:get/get.dart';
import '../../data/model/cart_item.dart';

class CashInwardController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var currentIndex = 0.obs;

  void changeIndex(int newIndex) {
    currentIndex.value = newIndex;
  }

  void addItem(CartItem item) {
    cartItems.add(item);
  }
}
