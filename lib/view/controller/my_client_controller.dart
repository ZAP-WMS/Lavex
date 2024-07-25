import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/model/get_client_model.dart';
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

  Future<List<MyClientModel>> deleteClient(id) async {
    isLoading(true);
    await ApiServices().DeleteClient(id).whenComplete(() {
      myClientData();
    });

    return myClientModel;
  }

  void myClientData() async {
    try {
      isLoading(true);
      List<MyClientModel> mydata = await ApiServices().myClient();
      if (searchTxt.text.isNotEmpty) {
        List<MyClientModel> filteredData = mydata
            .where((item) => item.client!.toLowerCase().contains(searchTxt.text
                    .toString()
                    .toLowerCase()) // Assuming the model has a 'name' property
                )
            .toList();
        myClientModel.clear();
        myClientModel.assignAll(filteredData);
      } else {
        myClientModel.assignAll(mydata);
      }
    } finally {
      isLoading(false);
    }
  }
}
