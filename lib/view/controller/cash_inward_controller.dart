import 'package:get/get.dart';
import '../../data/model/cart_item.dart';

class CashInwardController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var currentIndex = 0.obs;
  var grandtotal = 0.0.obs;
  var individualValue = false.obs;
  var gstValue = false.obs;
  var acceptedValue = false.obs;
  var accountingValue = false.obs;

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

  void toggleCheckedValue(String title, bool? value) {
    switch (title) {
      case 'Individual':
        individualValue.value = value ?? false;
        break;
      case 'gst':
        gstValue.value = value ?? false;
        break;
      case 'Accepted':
        acceptedValue.value = value ?? false;
        break;
      case 'account':
        accountingValue.value = value ?? false;
        break;
      default:
        break;
    }
  }
}
