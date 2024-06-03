import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/item_master.dart';

class ItemMasterController extends GetxController {
  var itemMasterModel = <ItemMasterModel>[].obs;
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
      List<ItemMasterModel> mydata = await ApiServices().itemMasterData();
      itemMasterModel.addAll(mydata);
    } finally {
      isLoading(false);
    }
  }
}
