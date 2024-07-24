import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/getallinwardentrymodel.dart';
import 'package:lavex/data/model/store_model.dart';

class StoreController extends GetxController {
  var storeModel = <StoreModel>[].obs;
  var inwardEntry = <Data>[].obs;

  var isLoading = true.obs;
  var currentIndex = 8.obs;

  void changeIndex(int newIndex) {
    currentIndex.value = newIndex;
  }

  @override
  void onInit() {
    getinwardData("");
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
