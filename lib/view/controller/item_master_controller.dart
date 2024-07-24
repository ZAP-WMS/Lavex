import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/item_master.dart';

import '../../data/model/getitemmodel.dart';

class ItemMasterController extends GetxController {
  var itemMasterModel = <itemData>[].obs;
  var isLoading = true.obs;
  var currentIndex = 0.obs;

  void changeIndex(int newIndex) {
    currentIndex.value = newIndex;
  }

  @override
  void onInit() {
    itemMasterData();
    super.onInit();
  }

  void itemMasterData() async {
    try {
      isLoading(true);
      List<itemData> mydata = await ApiServices().getallItem();
      print(mydata);
      itemMasterModel.assignAll(mydata);
    } finally {
      isLoading(false);
    }
  }
}
