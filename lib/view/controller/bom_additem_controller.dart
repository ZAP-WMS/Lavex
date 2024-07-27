import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';

import '../../data/model/bom_add_item.dart';
import '../../data/model/bomitemmodel.dart';

class BomAddItemController extends GetxController {
  var bomItems = <BomAddItemModel>[].obs;
  List<bomitemModel> listAllbom = <bomitemModel>[].obs;
  @override
  void onInit() {
    getallBom();
    super.onInit();
  }

  void addItem(BomAddItemModel item) {
    bomItems.add(item);
  }

  getallBom() async {
    listAllbom.assignAll(await ApiServices().getallBom());
  }

  void removeItem(int index) {
    print('Before removal: ${bomItems.toList()}');
    bomItems.removeAt(index);
    print('After removal: ${bomItems.toList()}');
  }

  getitem() {
    List<BomAddItemModel> data = bomItems.map((f) => f).toList();
    return data;
  }
}
