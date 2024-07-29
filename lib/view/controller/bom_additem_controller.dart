import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';

import '../../data/model/bom_add_item.dart';
import '../../data/model/bomitemmodel.dart';
import '../../data/model/getallBom.dart';

class BomAddItemController extends GetxController {
  var bomItems = <BomAddItemModel>[].obs;
  RxString serch = ''.obs;
  RxBool loading = false.obs;
  var listAllbom = <Allbom>[].obs;
  @override
  void onInit() {
    getallBom();
    super.onInit();
  }

  void addItem(BomAddItemModel item) {
    bomItems.add(item);
  }

  getallBom() async {
    loading(true);
    if (serch.isEmpty) {
      listAllbom.assignAll(await ApiServices().getallBom());
    } else {
      List<Allbom> data =
          await ApiServices().getallBom().whenComplete(() => null);
      var data1 = data.where((element) => element.readyStock!.name!
          .toLowerCase()
          .contains(serch.value.toString().toLowerCase()));
      listAllbom.assignAll(data1);
      print(data1);
    }
    loading(false);
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
