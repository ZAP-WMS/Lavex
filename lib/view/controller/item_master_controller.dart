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

  Future itemMasterData() async {
    try {
      isLoading(true);
      List<itemData> mydata = await ApiServices().getallItem();
      print(mydata);
      itemMasterModel.assignAll(mydata);
    } finally {
      isLoading(false);
    }
  }

  void filter(String data) {
    itemMasterData().whenComplete(() {
      if (data.isNotEmpty) {
        List<itemData> filteredData = itemMasterModel
            .where((item) => item.name!.toLowerCase().contains(data
                    .toString()
                    .toLowerCase()) // Assuming the model has a 'name' property
                )
            .toList();
        itemMasterModel.clear();
        itemMasterModel.addAll(filteredData);
      }
    });
  }
}
