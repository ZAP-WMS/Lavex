import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/production_store.dart';

class CreateInvoiceController extends GetxController {
  RxList stockName = [].obs;
  RxList stockBrand = [].obs;

  getProductionData() async {
    ProductioStore data = await ApiServices().getProductionData();
    List<ProductioStore> item = [];
    data.data.forEach((element) {
      stockName.addAll(element.readyStock.map((e) => e.name));
      stockBrand.addAll(element.readyStock.map((e) => e.brand));
    });
  }
}
