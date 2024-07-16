import 'package:get/get.dart';
import '../../data/data_source/remote/api_service.dart';
import '../../data/model/cart_item.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var individualValue = false.obs;
  var gstValue = false.obs;
  var maturityValue = false.obs;
  var accountingValue = false.obs;
  List<String> clientlist = [
    'data1',
    'data2',
    'data3',
  ].obs;
  RxBool loader = (true).obs;

  Future<void> getclientlist() async {
    loader(false);
    List<String> data = await ApiServices().getClientlist().whenComplete(() {
      loader(true);
    });
    clientlist.assignAll(data);
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
      case 'maturity':
        maturityValue.value = value ?? false;
        break;
      case 'account':
        accountingValue.value = value ?? false;
        break;
      default:
        break;
    }
    // checkedValue.value = value ?? false;
  }
}
