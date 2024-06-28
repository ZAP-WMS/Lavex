import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/model/my_clients.dart';
import '../../data/data_source/remote/api_service.dart';

class MyClientController extends GetxController {
  var myClientModel = <MyClientModel>[].obs;
  var searchTxt = TextEditingController();
  var isLoading = true.obs;

  @override
  void onInit() {
    myClientData();
    super.onInit();
  }

  void myClientData() async {
    try {
      isLoading(true);
      List<MyClientModel> mydata = await ApiServices().myClient();
      if (searchTxt.text.isNotEmpty) {
        List<MyClientModel> filteredData = mydata
            .where((item) => item.clientName.toLowerCase().contains(searchTxt
                    .text
                    .toString()
                    .toLowerCase()) // Assuming the model has a 'name' property
                )
            .toList();
        myClientModel.clear();
        myClientModel.addAll(filteredData);
      } else {
        myClientModel.addAll(mydata);
      }
    } finally {
      isLoading(false);
    }
  }
}
