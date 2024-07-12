import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lavex/data/model/singel_companey.dart';
import 'dart:convert';

import 'package:lavex/utils/api_string.dart';

import '../../data/model/add_companie_model.dart' as model;
import '../../data/model/getcompeny_model.dart';
import '../../utils/colors.dart';

class CompanyController extends GetxController {
  var companyList = <String>[].obs;
  List<Data> companeydata = <Data>[].obs;
  var selectedCompany = ''.obs;
  var companyName = ''.obs;
  Rx<Color> bgColor = redColor.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
  }

  Future<void> fetchCompanies() async {
    try {
      final response = await http.get(Uri.parse(baseUrl + getallcompeney));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var companey = Getallcompeney.fromJson(data);
        companeydata.assignAll(companey.data!.toList());
        if (companey.data!.isNotEmpty) {
          companyList.assignAll(companey.data!
              .map((company) => company.name.toString())
              .toList());
        }
        companyList.add("Create companey");
        print(companyList);
      } else {
        throw Exception('Failed to load companies');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<Singelcompeney> fetchsingelCompanie(String id) async {
    print(id);
    try {
      final response = await http.get(Uri.parse(baseUrl + singlecompeney + id));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var companey = Singelcompeney.fromJson(data["data"]);

        print(companey);
        return companey;
      } else {
        throw Exception('Failed to load companies');
      }
    } catch (e) {
      print('Error: $e');
    }
    return Singelcompeney();
  }

  Future<String> addCompaney(model.addcompeney obj) async {
    try {
      final dio = Dio();
      print(jsonEncode(obj.toJson()));
      var response = await dio.post(baseUrl + addcompeney, data: obj.toJson());

      if (response.statusCode == 200) {
        Get.snackbar("Status", response.data["message"].toString(),
            snackPosition: SnackPosition.BOTTOM);
        if (response.data["success"]) {
          fetchCompanies();
        }
        return "";
      } else {
        throw Exception('Failed to load companies');
      }
    } on Exception catch (e) {
      print(e);
    }
    return "";
  }

  Future<String> DeleteCompaney(String id) async {
    try {
      final dio = Dio();
      print(id);
      var response = await dio.delete(baseUrl + deletecompeney + id);

      if (response.statusCode == 200) {
        Get.snackbar("Status", response.data["message"].toString(),
            snackPosition: SnackPosition.BOTTOM);
        print(response.data["message"].toString());
        if (response.data["success"]) {
          fetchCompanies();
        }
        return "200";
      } else {
        throw Exception('Failed to load companies');
      }
    } on Exception catch (e) {
      print(e);
    }
    return "";
  }

  void changeCompany(String company) {
    selectedCompany.value = company;
    updateCompanyName(selectedCompany.value);
  }

  void updateCompanyName(String newName) {
    companyName.value = newName;
    // Update the background color based on the company name
    if (newName == 'Organic Hygiene Products LLP') {
      bgColor.value = redColor;
    } else if (newName == 'SDD Marketing (NM)') {
      bgColor.value = Colors.green;
    } else {
      bgColor.value = Colors.orange;
    }
  }
}
