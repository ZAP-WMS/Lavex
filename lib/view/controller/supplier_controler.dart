import 'package:get/get.dart';

import '../../data/data_source/remote/api_service.dart';
import '../../data/model/supplier_payments.dart';

class SupplierController extends GetxController {
  var supplierModel = <SupplierPaymentsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchSupplierData();
    super.onInit();
  }

  void fetchSupplierData() async {
    try {
      isLoading(true);
      List<SupplierPaymentsModel> mydata = await ApiServices().supplierData();
      supplierModel.addAll(mydata);
    } finally {
      isLoading(false);
    }
  }
}
