import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data_source/remote/api_service.dart';
import '../../data/model/supplier_payments.dart';

class SupplierController extends GetxController {
  var supplierModel = <SupplierPaymentsModel>[].obs;
  var searchTxt = TextEditingController();
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
      if (searchTxt.text.isNotEmpty) {

        List<SupplierPaymentsModel> filteredData = mydata
           .where( (item) => item.supplierName.toLowerCase().contains(searchTxt
                    .text
                    .toString()
                    .toLowerCase()) // Assuming the model has a 'name' property
                )
            .toList();
        supplierModel.clear();
        supplierModel.addAll(filteredData);
      } else {
        supplierModel.addAll(mydata);
      }
    } finally {
      isLoading(false);
    }
  }
}
