import 'package:get/get.dart';
import '../../data/model/cart_item.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addItem(CartItem item) {
    cartItems.add(item);
  }
}
