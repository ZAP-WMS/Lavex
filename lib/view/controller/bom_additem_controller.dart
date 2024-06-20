import 'package:get/get.dart';

import '../../data/model/bom_add_item.dart';

class BomAddItemController extends GetxController {
  var bomItems = <BomAddItemModel>[].obs;

  void addItem(BomAddItemModel item) {
    bomItems.add(item);
  }
}
