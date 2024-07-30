import 'package:get/get.dart';
import 'package:lavex/data/model/store_model.dart';
import '../../data/model/cart_item.dart';

class ProductionController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var storeModel = <StoreModel>[].obs;
  var isLoading = true.obs;
  var accp = false.obs;
  var currentIndex = 0.obs;

  void changeIndex(int newIndex) {
    currentIndex.value = newIndex;
  }

  void addItem(CartItem item) {
    cartItems.add(item);
  }

  void toggleCheckedValue(String s, bool? value) {
    accp(value!);
  }
}
