import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/getallinwardentrymodel.dart';
import 'package:lavex/data/model/store_model.dart';

import '../../data/model/purchaseStoreModel.dart';

class StoreController extends GetxController {
  var storeModel = <StoreModel>[].obs;
  var inwardEntry = <Data>[].obs;
  List<Purchaseitem> purchaseStore = <Purchaseitem>[].obs;

  var isLoading = true.obs;
  var currentIndex = 8.obs;

  void changeIndex(int newIndex) {
    currentIndex.value = newIndex;
  }

  @override
  void onInit() {
    getinwardData("");
    // ApiServices().purchaseStoreData();
    storeData();
    super.onInit();
  }

  void storeData() async {
    PurchaseStoreModel data = await ApiServices().purchaseStoreData();
    print(data);
    List<Purchaseitem> item = [];
    data.data!.forEach((element) {
      item.addAll(element.item.map((e) => e));
    });
    print(item);
    purchaseStore.assignAll(item);
    print(purchaseStore);
  }

  void getinwardData(String type) async {
    try {
      isLoading(true);
      List<Data> mydata = await ApiServices().getinward(type);
      inwardEntry.assignAll(mydata);
    } finally {
      isLoading(false);
    }
  }
}
