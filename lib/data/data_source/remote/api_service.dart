import 'dart:convert';
import 'dart:js_interop';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/model/InwardEntrymodel.dart';
import 'package:lavex/data/model/get_client_model.dart';
import 'package:lavex/data/model/proforma_invoice.dart';
import 'package:lavex/data/model/item_master.dart';

import 'package:lavex/data/model/my_payments.dart';
import 'package:http/http.dart' as http;
import 'package:lavex/data/model/store_model.dart';
import 'package:lavex/data/model/supplier_payments.dart';
import 'package:lavex/utils/api_string.dart';
import '../../../routes/route_pages.dart';
import '../../model/add_client_model.dart';
import '../../model/add_companie_model.dart' as model;
import '../../model/add_item.dart';
import '../../model/credit_note.dart';
import '../../model/debit_note.dart';
import '../../model/getallinwardentrymodel.dart';
import '../../model/invoice.dart';
import '../../model/register_model.dart';
import '../local/shared_preference.dart';

class ApiServices {
  final dio = Dio();
  Future<ProformaInvoiceModel> proFormaData(
      ProformaInvoiceModel proformaData) async {
    try {
      Uri url = Uri.parse('$baseUrl$proFormaUrl');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json'
            // Add other headers if needed
          },
          body: jsonEncode(proformaData.data!.toJson()));
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseData['success']) {
          var data = proformaInvoiceModelFromJson(response.body);
          return data;
        } else {
          print(proformaData.data!.toJson());
          print('message${responseData['message']}');
          throw Exception('Failed to create payment');
        }
      } else {
        throw Exception('Failed to create payment: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to create payment: $e');
    }
  }

  Future<void> Addinward(InwardEntrymodel data) async {
    try {
      print(data);
      var response = await dio.post('$baseUrl$addinward', data: data.toJson());
      print(response.data["message"]);

      if (response.statusCode == 200) {
        if (response.data["success"] ?? false) {
          print(response.data["success"]);
          Get.snackbar("Status", response.data["message"].toString(),
              snackPosition: SnackPosition.BOTTOM);
          Get.back();
          // Get.back();
        } else {
          print('message${response.data["message"]}');
          throw Exception('Failed to create payment');
        }
      } else {
        Get.snackbar("Status", response.data["message"].toString(),
            snackPosition: SnackPosition.BOTTOM);
        // throw Exception('Failed to create payment: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to create payment: $e');
    }
  }

  getinward() async {
    try {
      var response = await dio.get('$baseUrl$getInward');
      print(response.data["message"]);
      if (response.statusCode == 200) {
        getallInwardEntryModel data =
            getallInwardEntryModel.fromJson(response.data);
        print(data);
        return data.data;
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<CreateInvoiceModel> invoiceData(
      CreateInvoiceModel createInvoiceModel) async {
    try {
      Uri url = Uri.parse('$baseUrl$invoiceUrl');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json'
            // Add other headers if needed
          },
          body: jsonEncode(createInvoiceModel.invoiceData.toJson()));
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseData['success']) {
          var data = createInvoiceModelFromJson(response.body);
          return data;
        } else {
          print('message${responseData['message']}');
          throw Exception('Failed to create payment');
        }
      } else {
        throw Exception('Failed to create payment: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to create payment: $e');
    }
  }

  Future<DebitNoteModel> debitData(DebitNoteModel debitNoteModel) async {
    try {
      Uri url = Uri.parse('$baseUrl$debitUrl');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json'
            // Add other headers if needed
          },
          body: jsonEncode(debitNoteModel.toJson()));
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseData['success']) {
          var data = debitNoteModelFromJson(response.body);
          return data;
        } else {
          print('message${responseData['message']}');
          throw Exception('Failed to create payment');
        }
      } else {
        throw Exception('Failed to create payment: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to create payment: $e');
    }
  }

  // credit invoice in create invoice
  Future<DebitNoteModel> creditData(CreditNoteModel creditNoteModel) async {
    try {
      Uri url = Uri.parse('$baseUrl$creditUrl');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json'
            // Add other headers if needed
          },
          body: jsonEncode(creditNoteModel.toJson()));
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseData['success']) {
          var data = debitNoteModelFromJson(response.body);
          return data;
        } else {
          print('message${responseData['message']}');
          throw Exception('Failed to create payment');
        }
      } else {
        throw Exception('Failed to create payment: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to create payment: $e');
    }
  }

// Add client APi
  Future<void> addClientData(AddClientModel addClientModel) async {
    try {
      var response = await dio.post('$baseUrl$addClientUrl',
          data: addClientModel.clientData.toJson());
      print(response.data["message"]);
      Get.snackbar("Status", response.data["message"].toString(),
          snackPosition: SnackPosition.BOTTOM);
      if (response.statusCode == 200) {
        if (response.data["success"] ?? false) {
          print(response.data["success"]);

          // Get.back();
        } else {
          print('message${response.data["message"]}');
          throw Exception('Failed to create payment');
        }
      } else {
        throw Exception('Failed to create payment: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to create payment: $e');
    }
  }

  Future<void> DeleteClient(String id) async {
    var response = await dio.delete('$baseUrl$deleteclient$id');

    print(response.data["message"]);

    if (response.statusCode == 200) {
      if (response.data["success"] ?? false) {
        print(response.data["success"]);
      } else {
        print('message${response.data["message"]}');
        throw Exception('Failed to create payment');
      }
    } else {
      throw Exception('Failed to create payment: ${response.statusMessage}');
    }
  }

  Future<List<String>> getClientlist() async {
    var response = await dio.get('$baseUrl$getclient');

    print(response.data["message"]);

    if (response.statusCode == 200) {
      if (response.data["success"] ?? false) {
        List<String>? clientlist = response.data["data"].cast<String>() ?? [];

        print(clientlist);
        return clientlist ?? [];
      } else {
        print('message${response.data["message"]}');
        throw Exception('Failed to create payment');
      }
    } else {
      throw Exception('Failed to create payment: ${response.statusMessage}');
    }
  }

  Future<ProformaInvoiceModel> myProFormaData(String type) async {
    Uri url = Uri.parse('$baseUrl$getProForma$type');
    var response = await http.get(url);
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    if (responseData['success']) {
      print(response.body);
      var data = proformaInvoiceModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

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
    Uri url = Uri.parse('$baseUrl$getallclient');
    var response = await http.get(url);

    print(response.body);
    if (response.statusCode == 200) {
      getClient? data;
      try {
        data = getClient.fromJson(jsonDecode(response.body));
        print(data);
      } on Exception catch (e) {
        print(e);
      }
      return data!.data ?? [];
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

  Future<void> registerUser(RegisterModel registerModel) async {
    final String apiUrl = baseUrl + registerUrl;

    if (registerModel.data != null) {
      try {
        final response = await http.post(Uri.parse(apiUrl),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode(registerModel.data!.toJson()));

        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['success']) {
          // If the server did return a 200 OK response,
          // then parse the JSON.

          print(responseData['message']);
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          throw Exception('Failed to register user');
        }
      } catch (e) {
        print(e);
      }
    } else {
      print(
          'Data object in RegisterModel is null'); // Handle case where data is null (if needed)
    }
  }

  Future<void> loginUser(
      BuildContext context, String username, String password) async {
    final requestBody = {
      'email': username,
      'password': password,
    };

    print('Request Body: ${jsonEncode(requestBody)}');

    try {
      final response = await http.post(Uri.parse(baseUrl + loginUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(requestBody));
      final responseData = jsonDecode(response.body);
      if (responseData['success']) {
        // Assuming the response is a JSON object with user data or a token
        if (responseData.containsKey('token')) {
          await saveToken(responseData['token']);
          print('Token saved successfully');
        }
        // else {
        //   print('Token not found in response');
        // }

        Get.toNamed(AppRoutes.menuBar);
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

  // Future<List<String>> fetchCompanies() async {
  //   final response = await http.get(Uri.parse(baseUrlTxt + comapanyUrlTxt));
  //   if (response.statusCode == 200) {
  //     List<dynamic> data = json.decode(response.body);
  //     return data.map((company) => company['name'].toString()).toList();
  //   } else {
  //     throw Exception('Failed to load companies');
  //   }
  // }

  Future<void> postItemData(AddItemModel itemData) async {
    final String url = baseUrlTxt + addItemUrlTxt;

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(itemData.toJson()),
      );

      if (response.statusCode == 200) {
        print('Success: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
