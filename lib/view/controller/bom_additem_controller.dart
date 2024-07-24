import 'package:get/get.dart';

import '../../data/model/bom_add_item.dart';

class BomAddItemController extends GetxController {
  RxList<BomAddItemModel> bomItems = <BomAddItemModel>[].obs;

  void addItem(BomAddItemModel item) {
    bomItems.add(item);
  }

  removeitem(index) {
    bomItems.removeAt(index);
    print(index);
  }

  getitem() {
    List<BomAddItemModel> data = bomItems.map((f) => f).toList();
    return data;
  }
}
