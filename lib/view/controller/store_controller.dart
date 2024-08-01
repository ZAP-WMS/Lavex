import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/getallinwardentrymodel.dart';
import 'package:lavex/data/model/store_model.dart';

import '../../data/model/all_productionentrymodel.dart';
import '../../data/model/getallStockmodel.dart';
import '../../data/model/productionstore.dart';
import '../../data/model/purchaseStoreModel.dart';

class StoreController extends GetxController {
  var storeModel = <StoreModel>[].obs;
  RxString OtherBrand = "".obs;
  var inwardEntry = <Data>[].obs;
  List<Purchaseitem> purchaseStore = <Purchaseitem>[].obs;
  var listproentry = <AllProductionentryData>[].obs;
  var listproductionstore = <ProductionstoreDataReadyStock>[].obs;
  var isLoading = true.obs;
  var liststock = <GetAllStockData>[].obs;
  var currentIndex = 8.obs;
  void changeIndex(int newIndex) {
    currentIndex.value = newIndex;
  }

  Future<void> updateStatus(List list, String status) async {
    for (var element in list) {
      await ApiServices().updateStatus(element, status);
    }
    getalldata();
  }

  getallproductionentry() async {
    isLoading(true);
    AllProductionentryModel data = await ApiServices().getallproductionentry();
    listproentry.assignAll(data.data!);
    isLoading(false);
  }

  getallStocklist() async {
    liststock.clear();
    List<GetAllStockData> data = await ApiServices().getallStocklist();
    liststock.addAll(data);
    print("liststock" + liststock.toList().toString());
  }

  prodionstoredata() async {
    listproductionstore.clear();
    ProductionstoreModel data = await ApiServices().productionStore();
    data.data!.forEach((e) => listproductionstore.addAll(e.readyStock!));
    print("hello" + listproductionstore.toList().toString());
  }

  @override
  void onInit() {
    getalldata();
    super.onInit();
  }

  void getalldata() {
    getinwardData("");
    // ApiServices().purchaseStoreData();
    storeData();
    getallproductionentry();
    prodionstoredata();
    getallStocklist();
  }

  void storeData() async {
    isLoading(true);
    PurchaseStoreModel data = await ApiServices().purchaseStoreData();
    print(data);
    List<Purchaseitem> item = [];
    data.data!.forEach((element) {
      item.addAll(element.item.map((e) => e));
    });
    print(item);
    purchaseStore.assignAll(item);
    print(purchaseStore);
    isLoading(false);
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
