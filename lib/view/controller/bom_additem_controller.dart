import 'package:get/get.dart';

import '../../data/model/bom_add_item.dart';

class BomAddItemController extends GetxController {
  var bomItems = <BomAddItemModel>[].obs;

  void addItem(BomAddItemModel item) {
    bomItems.add(item);
  }

  void removeItem(int index) {
    print('Before removal: ${bomItems.toList()}');
    bomItems.removeAt(index);
    print(index);
  }

  getitem() {
    List<BomAddItemModel> data = bomItems.map((f) => f).toList();
    return data;
  }
}
