import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lavex/utils/api_string.dart';

class CompanyController extends GetxController {
  var companyList = <String>[].obs;
  var selectedCompany = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
  }

  Future<void> fetchCompanies() async {
    try {
      final response = await http.get(Uri.parse(baseUrlTxt + comapanyUrlTxt));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        companyList.assignAll(data.map((company) => company['name'].toString()).toList());
      } else {
        throw Exception('Failed to load companies');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void changeCompany(String company) {
    selectedCompany.value = company;
  }
}
