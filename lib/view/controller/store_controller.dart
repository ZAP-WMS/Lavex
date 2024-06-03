import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/item_master.dart';
import 'package:lavex/data/model/store_model.dart';

class StoreController extends GetxController {
  var storeModel = <StoreModel>[].obs;
  var isLoading = true.obs;
  var currentIndex = 0.obs;

  void changeIndex(int newIndex) {
    currentIndex.value = newIndex;
  }

  @override
  void onInit() {
    storeData();
    super.onInit();
  }

  void storeData() async {
    try {
      isLoading(true);
      List<StoreModel> mydata = await ApiServices().storeData();
      storeModel.addAll(mydata);
    } finally {
      isLoading(false);
    }
  }
}
