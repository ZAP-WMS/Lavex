import 'package:flutter/material.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/add_item.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import '../../../common/custom_text.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_spacebar.dart';
import '../../../widgets/custom_textform.dart';
import '../../../widgets/drop_downTextField.dart';

class AddItemMaster extends StatelessWidget {
  AddItemMaster({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  TextEditingController qtyTypeController = TextEditingController();
  TextEditingController itemCodeController = TextEditingController();
  TextEditingController storeController = TextEditingController();
  TextEditingController manufacturerController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController quantityTypeController = TextEditingController();
  TextEditingController lawQtyController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController hsnCodeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController stockStatusController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  List<String> paymentField = [
    'Name',
    'Qty',
    'Qty Type',
    'Item Code',
    'Store',
    'Manufacturer',
    'Brand',
    'Quantity Type',
    'Law Quantity',
    'Price',
    'GST %',
    'HSN Code',
    'Category',
    'Quantity',
    'Stock Status',
    'Currency',
    'Status',
  ];
  List<String> clients = [
    'Show only paid, unpaid invoices',
    'Show only paid invoices',
    'Show only unpaid invoices',
    'Show only partially paid invoices',
  ];
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        body: Column(
      children: [
        Wrap(
          direction: Axis.horizontal,
          children: paymentField.asMap().entries.map((entry) {
            int index = entry.key;
            String field = entry.value;
            if (field == 'Qty Type' ||
                field == 'Store' ||
                field == 'Manufacturer' ||
                field == 'Brand' ||
                field == 'Quantity Type' ||
                field == 'GST %' ||
                field == 'Stock Status' ||
                field == 'Currency' ||
                field == 'Status') {
              // Render dropdown for Client Name
              return Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CTextBlack(field, mBold: true, mSize: 14),
                    Container(
                      width: 300,
                      height: 35,
                      child: DropdownTextField<String>(
                        items: clients,
                        hintText: field,
                        itemAsString: (item) => item,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomField(
                  width: 300,
                  height: 35,
                  name: field,
                  controller: nameController,
                  style: TextStyle(), // Define your normalTextStyle here
                  isreadOnly: false,
                  isSuffixIcon: false,
                  validator: (value) {
                    // Define your validator logic here
                    if (value == null || value.isEmpty) {
                      return 'Please enter $field';
                    }
                    return null;
                  },
                ),
              );
            }
          }).toList(),
        ),
        verticalSpace(10),
        Row(children: [
          CustomButton(
              text: 'Add Item',
              onPressed: () {
                ApiServices().postItemData(AddItemModel(
                    forUser: 101,
                    forCompany: 102,
                    name: nameController.text,
                    manufacturerName: manufacturerController.text,
                    itemCode: itemCodeController.text,
                    quantity: int.parse(quantityController.text),
                    quantityType: quantityTypeController.text,
                    lowQuantity: int.parse(lawQtyController.text),
                    singlePrice: int.parse(priceController.text),
                    currency: currencyController.text,
                    gstRate: int.parse(gstController.text),
                    hsnCode: hsnCodeController.text,
                    stockStatus: stockStatusController.text,
                    storeId: 10,
                    brandName: brandController.text,
                    category: categoryController.text,
                    storeName: storeController.text,
                    total: 1,
                    qtySingleP: int.parse(qtyController.text),
                    qtyTypeSingleP: qtyController.text,
                    status: statusController.text));
              }),
          horizontalSpace(10),
          CustomButton(text: 'Cancel', onPressed: () {})
        ]),
      ],
    ));
  }
}
