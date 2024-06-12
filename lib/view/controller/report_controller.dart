import 'package:get/get.dart';

class ReportController extends GetxController {
  var selectedItem = ''.obs;

  var fields = <String>[].obs;

  // Function to handle the change in dropdown selection
  void onItemSelected(String? value) {
    selectedItem.value = value ?? '';
    if (selectedItem.value == 'Movement report') {
      fields.value = ['From date', 'To date'];
    } else if (selectedItem.value == 'Over due outstanding report') {
      fields.value = [
        'From date',
        'To date',
        'Client Name',
        'Area',
        'Invoice Type'
      ];
    } else if (selectedItem.value == 'Supplier Payment Report') {
      fields.value = [
        'From date',
        'To date',
        'Supplier Name',
      ];
    } else if (selectedItem.value == 'Sales Reports Area Wise') {
      fields.value = [
        'From date',
        'To date',
        'Invoice Type',
        'Area',
        'Client Name',
      ];
    } else if (selectedItem.value == 'Supplier Payment Report') {
      fields.value = [
        'From date',
        'To date',
        'Invoice Type',
        'Area',
        'Product Name',
      ];
    } else if (selectedItem.value == 'Ledger Report') {
      fields.value = [
        'From Year',
        'To Year',
        'Client Name',
        'Supplier Name',
      ];
    } else if (selectedItem.value == 'Purchase Report') {
      fields.value = [
        'From date',
        'To date',
        'Client Name',
      ];
    } else if (selectedItem.value == 'Cubic Purchase Report') {
      fields.value = [
        'From date',
        'To date',
        'Supplier Name',
      ];
    } else if (selectedItem.value == 'Product Report') {
      fields.value = [
        'Company Name',
        'From date',
        'To date',
        'Product Name',
        'Brand Name',
        'Invoice Type'
      ];
    }
  }
}
