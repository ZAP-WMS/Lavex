import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lavex/data/model/item_master.dart';
import 'package:lavex/data/model/my_clients.dart';
import 'package:lavex/data/model/my_payments.dart';
import 'package:http/http.dart' as http;
import 'package:lavex/data/model/store_model.dart';
import 'package:lavex/data/model/supplier_payments.dart';
import 'package:lavex/utils/api_string.dart';
import '../../../view/presentation/homepage/menu_page.dart';

class ApiServices {
  Future<List<MyPaymentsModel>> myPaymentData() async {
    Uri url = Uri.parse('$baseUrlTxt$myPaymentsEndUrlTxt');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = myPaymentsModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<SupplierPaymentsModel>> supplierData() async {
    Uri url = Uri.parse('$baseUrlTxt$supplierEndUrlTxt');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = supplierPaymentsModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<MyClientModel>> myClient() async {
    Uri url = Uri.parse('$baseUrlTxt$myClientEndUrlTxt');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = MyClientModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

// item master
  Future<List<ItemMasterModel>> itemMasterData() async {
    Uri url = Uri.parse('$baseUrlTxt$itemMasterEndUrlTxt');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = itemMasterModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

// store table Data
// item master
  Future<List<StoreModel>> storeData() async {
    Uri url = Uri.parse('$baseUrlTxt$itemMasterEndUrlTxt');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = storeModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> registerUser(String username, String email, String password,
      String phoneNumber) async {
    final String apiUrl = baseUrlTxt + loginUrl;
    print(apiUrl);

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': username,
        'email': email,
        'password': password,
        'phoneNum': phoneNumber,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print('User registered successfully');
      print(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to register user');
    }
  }

  Future<void> loginUser(
      BuildContext context, String username, String password) async {
    final requestBody = {
      'username': username,
      'password': password,
    };

    print('Request Body: ${jsonEncode(requestBody)}');

    try {
      final response = await http.post(
        Uri.parse(baseUrlTxt + loginUrlTxt),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        // Assuming the response is a JSON object with user data or a token
        final responseData = jsonDecode(response.body);
        print('Login successful');
        print('User Data: $responseData');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MenuPage()),
        );
      } else {
        print('Failed to login. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        throw Exception('Failed to login. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
      throw Exception('An error occurred while logging in: $e');
    }
  }
}
