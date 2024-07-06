import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom_text.dart';
import '../../../data/model/cart_item.dart';
import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_checkbox.dart';
import '../../../widgets/custom_spacebar.dart';
import '../../../widgets/custom_textform.dart';
import '../../../widgets/cutom_textformfield.dart';
import '../../../widgets/icon_with_text.dart';
import '../../controller/cash_inward_controller.dart';

class InwardEntry extends GetView<CashInwardController> {
  InwardEntry({super.key});

  final TextEditingController clientController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController invoiceController = TextEditingController();
  final TextEditingController shortCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController increaseInvoiceController =
      TextEditingController();
  final TextEditingController toShippedController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController invoiceDateController = TextEditingController();
  final TextEditingController forToShippedController = TextEditingController();
  final TextEditingController stateCodeController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController selectedCurrencyController =
      TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController poNoController = TextEditingController();
  final TextEditingController maturityDateController = TextEditingController();
  final TextEditingController delieveryChallanController =
      TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();
  final TextEditingController paymentMethodController = TextEditingController();

  // table controller
  final TextEditingController itemController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: greyColor)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomField(
                          width: 300,
                          height: 40,
                          name: forUnitTxt,
                          controller: clientController,
                          style: normalTextStyle,
                          isreadOnly: false,
                          isSuffixIcon: false,
                          validator: (value) {}),
                      //    customAlertDialog(context, clientController)
                    ],
                  ),
                  CustomField(
                      width: 300,
                      height: 40,
                      name: accountablePersonTxt,
                      controller: addressController,
                      style: normalTextStyle,
                      isreadOnly: false,
                      isSuffixIcon: false,
                      validator: (value) {}),
                  CustomField(
                      width: 300,
                      height: 40,
                      name: cashMovementNo,
                      controller: invoiceController,
                      style: normalTextStyle,
                      isreadOnly: false,
                      isSuffixIcon: false,
                      validator: (value) {}),
                ],
              ),
              MyCheckbox(
                titleName: individualTxt,
                onChanged: (value) {},
              ),
              verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomField(
                      width: 300,
                      height: 40,
                      name: supplierName,
                      controller: shortCodeController,
                      style: normalTextStyle,
                      isreadOnly: false,
                      isSuffixIcon: false,
                      validator: (value) {}),
                  CustomField(
                      width: 300,
                      height: 40,
                      name: cityTxt,
                      controller: cityController,
                      style: normalTextStyle,
                      isreadOnly: false,
                      isSuffixIcon: false,
                      validator: (value) {}),
                  CustomField(
                      width: 300,
                      height: 40,
                      name: dateCreateFromTxt,
                      controller: increaseInvoiceController,
                      style: normalTextStyle,
                      isreadOnly: false,
                      isSuffixIcon: false,
                      validator: (value) {}),
                ],
              ),
              verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomField(
                      width: 300,
                      height: 40,
                      name: shortCodeTxt,
                      controller: toShippedController,
                      style: normalTextStyle,
                      isreadOnly: false,
                      isSuffixIcon: false,
                      validator: (value) {}),
                  CustomField(
                      width: 300,
                      height: 40,
                      name: addressTxt,
                      controller: stateController,
                      style: normalTextStyle,
                      isreadOnly: false,
                      isSuffixIcon: false,
                      validator: (value) {}),
                  CustomField(
                      width: 300,
                      height: 40,
                      name: supplierInvoiceNo,
                      controller: invoiceDateController,
                      style: normalTextStyle,
                      isreadOnly: false,
                      isSuffixIcon: false,
                      validator: (value) {}),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomField(
                      width: 300,
                      height: 40,
                      name: countryTxt,
                      controller: stateCodeController,
                      style: normalTextStyle,
                      isreadOnly: false,
                      isSuffixIcon: false,
                      validator: (value) {}),
                  CustomField(
                      width: 300,
                      height: 40,
                      name: selectedCurrencyTxt,
                      controller: selectedCurrencyController,
                      style: normalTextStyle,
                      isreadOnly: false,
                      isSuffixIcon: false,
                      validator: (value) {}),
                ],
              ),
              MyCheckbox(
                titleName: accountingTxt,
                onChanged: (value) {},
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: greyColor)),
                child: Obx(
                  () => DataTable(
                      columnSpacing: 30,
                      columns: const <DataColumn>[
                        DataColumn(label: Text('Item')),
                        DataColumn(label: Text('Brand')),
                        DataColumn(label: Text('Quantity')),
                        DataColumn(label: Text('GST')),
                        DataColumn(label: Text('Price')),
                        DataColumn(label: Text('Total')),
                      ],
                      rows: [
                        DataRow(
                            cells: List.generate(6, (index) {
                          return DataCell(Container(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            width: (index == 0) || (index == 1) ? 150 : 60,
                            child: TextFormField(
                              decoration: const InputDecoration(),
                              onChanged: (value) {
                                // Handle onChanged event
                              },
                            ),
                          ));
                        }))
                      ]..addAll(controller.cartItems.map((item) {
                          return DataRow(cells: [
                            DataCell(Container(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              width: 150,
                              child: TextFormField(
                                controller: itemController,
                                // initialValue: item.item.toString(),
                                onChanged: (value) {
                                  //        _itemNameController.text = value;
                                  // Update the item name when user changes it
                                },
                              ),
                            )),
                            DataCell(Container(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              width: 150,
                              child: TextFormField(
                                controller: brandController,
                                //    initialValue: item.brand.toString(),
                                onChanged: (value) {
                                  // Update the brand when user changes it
                                },
                              ),
                            )),
                            DataCell(Container(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              width: 60,
                              child: TextFormField(
                                controller: quantityController,
                                //    initialValue: item.quantity.toString(),
                                onChanged: (value) {
                                  // Update the quantity when user changes it
                                },
                              ),
                            )),
                            DataCell(Container(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              width: 60,
                              child: TextFormField(
                                controller: gstController,
                                //       initialValue: item.gst.toString(),
                                onChanged: (value) {
                                  // Update the GST when user changes it
                                },
                              ),
                            )),
                            DataCell(Container(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              width: 60,
                              child: TextFormField(
                                controller: priceController,
                                //        initialValue: item.price.toString(),
                                onChanged: (value) {
                                  // Update the price when user changes it
                                },
                              ),
                            )),
                            DataCell(Container(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              width: 60,
                              child: Text(
                                '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                              ),
                            )),
                          ]);
                        }).toList())),
                ),
              ),
              IconWithText(
                iconData: Icons.add,
                text: 'Add Item',
                onPressed: () {
                  // Add new item to the cartItems list
                  final CartItem newItem = CartItem(
                      item: 'item',
                      brand: 'brand',
                      quantity: 1,
                      gst: 18.00,
                      price: 15,
                      total: 15.00);
                  controller.addItem(newItem);
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CTextBlack(
                            movementAmountTxt,
                            mSize: 14,
                          ),
                          const Text('0.00 INR')
                        ],
                      ),
                      verticalSpace(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CTextBlack(
                            discountTxt,
                            mSize: 14,
                          ),
                          Row(
                            children: [
                              CustomTextFormField(
                                  width: 50,
                                  height: 30,
                                  controller: discountController,
                                  name: '0.00',
                                  validator: (p0) {},
                                  style: normalTextStyle),
                              const Text('0.00 INR')
                            ],
                          )
                        ],
                      ),
                      verticalSpace(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CTextBlack(
                            taxIncludeTxt,
                            mSize: 14,
                          ),
                          const Text('0.00 INR')
                        ],
                      ),
                      verticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CTextBlack(
                            grandTotalTxt,
                            mSize: 16,
                          ),
                          const Text('0.00 INR')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: CTextBlack(remarkTxt, mSize: 15, mBold: true)),
                  CustomTextFormField(
                    width: double.infinity,
                    name: '',
                    controller: remarkController,
                    style: normalTextStyle,
                    validator: (value) {},
                  ),
                  verticalSpace(20),
                  Row(
                    children: [
                      CTextBlack(paymentMethodTxt, mSize: 14, mBold: true),
                      horizontalSpace(20),
                      CustomTextFormField(
                        width: 250,
                        height: 30,
                        controller: paymentMethodController,
                        name: '',
                        style: normalTextStyle,
                        validator: (p0) {},
                      ),
                      horizontalSpace(20),
                      CTextBlack(betrayedTxt, mSize: 14, mBold: true),
                      horizontalSpace(20),
                      CustomTextFormField(
                        width: 250,
                        height: 30,
                        controller: paymentMethodController,
                        name: '',
                        style: normalTextStyle,
                        validator: (p0) {},
                      ),
                      horizontalSpace(20),
                      CTextBlack(acceptedTxt, mSize: 14, mBold: true),
                      horizontalSpace(20),
                      CustomTextFormField(
                        width: 250,
                        height: 30,
                        controller: paymentMethodController,
                        name: '',
                        style: normalTextStyle,
                        validator: (p0) {},
                      )
                    ],
                  ),
                ],
              ),
              verticalSpace(20),
              Row(
                children: [
                  CustomButton(
                      width: 200, text: createInwardTxt, onPressed: () {}),
                  horizontalSpace(10),
                  CTextBlack('Or'),
                  horizontalSpace(10),
                  CTextRed('Open Store Movement', mSize: 15)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
