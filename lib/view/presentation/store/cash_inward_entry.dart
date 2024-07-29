import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';

import '../../../common/custom_text.dart';
import '../../../data/model/InwardEntrymodel.dart';
import '../../../data/model/cart_item.dart';
import '../../../routes/route_pages.dart';
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
import '../../controller/store_controller.dart';

class CashInward extends GetView<CashInwardController> {
  CashInward({super.key});

  final TextEditingController uniteController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cashMovementNoController =
      TextEditingController();
  final TextEditingController shortCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController dateCreateController = TextEditingController();
  final TextEditingController toShippedController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController supplierInvoiceNoController =
      TextEditingController();
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
  final TextEditingController suppliernameController = TextEditingController();
  final TextEditingController accountablePersonController =
      TextEditingController();
  Rx<bool> accp = Rx<bool>(false);
  // table controller
  final TextEditingController itemController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final StoreController storeController = Get.put(StoreController());
  final List<Item> item = [Item()];
  final _formkey = GlobalKey<FormState>();
  Rx<bool> Loader = Rx<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: greyColor)),
            child: Loader.value
                ? Form(
                    key: _formkey,
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
                                    // height: 40,  
                                    name: forUnitTxt,
                                    controller: uniteController,
                                    style: normalTextStyle,
                                    isreadOnly: false,
                                    isSuffixIcon: false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        print("object");
                                        return "this field is required";
                                      }
                                    }),
                                //    customAlertDialog(context, uniteController)
                              ],
                            ),
                            CustomField(
                                width: 300,
                                // height: 40,
                                name: accountablePersonTxt,
                                controller: accountablePersonController,
                                style: normalTextStyle,
                                isreadOnly: false,
                                isSuffixIcon: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    print("object");
                                    return "this field is required";
                                  }
                                }),
                            CustomField(
                                width: 300,
                                // height: 40,
                                name: cashMovementNo,
                                controller: cashMovementNoController,
                                style: normalTextStyle,
                                isreadOnly: false,
                                isSuffixIcon: false,
                                validator: (value) {
                                  // if (value!.isEmpty) {
                                  //   print("object");
                                  //   return "this field is required";
                                  // }
                                }),
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
                                // height: 40,
                                name: supplierName,
                                controller: suppliernameController,
                                style: normalTextStyle,
                                isreadOnly: false,
                                isSuffixIcon: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    print("object");
                                    return "this field is required";
                                  }
                                }),
                            CustomField(
                                width: 300,
                                // height: 40,
                                name: cityTxt,
                                controller: cityController,
                                style: normalTextStyle,
                                isreadOnly: false,
                                isSuffixIcon: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    print("object");
                                    return "this field is required";
                                  }
                                }),
                            CustomField(
                                width: 300,
                                // height: 40,
                                name: dateCreateFromTxt,
                                controller: dateCreateController,
                                style: normalTextStyle,
                                isreadOnly: false,
                                isSuffixIcon: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    print("object");
                                    return "this field is required";
                                  }
                                }),
                          ],
                        ),
                        verticalSpace(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomField(
                                width: 300,
                                // height: 40,
                                name: shortCodeTxt,
                                controller: shortCodeController,
                                style: normalTextStyle,
                                isreadOnly: false,
                                isSuffixIcon: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    print("object");
                                    return "this field is required";
                                  }
                                }),
                            CustomField(
                                width: 300,
                                // height: 40,
                                name: addressTxt,
                                controller: addressController,
                                style: normalTextStyle,
                                isreadOnly: false,
                                isSuffixIcon: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    print("object");
                                    return "this field is required";
                                  }
                                }),
                            CustomField(
                                width: 300,
                                // height: 40,
                                name: supplierInvoiceNo,
                                controller: supplierInvoiceNoController,
                                style: normalTextStyle,
                                isreadOnly: false,
                                isSuffixIcon: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    print("object");
                                    return "this field is required";
                                  }
                                }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomField(
                                width: 300,
                                // height: 40,
                                name: countryTxt,
                                controller: countryController,
                                style: normalTextStyle,
                                isreadOnly: false,
                                isSuffixIcon: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    print("object");
                                    return "this field is required";
                                  }
                                }),
                            CustomField(
                                width: 300,
                                // height: 40,
                                name: selectedCurrencyTxt,
                                controller: selectedCurrencyController,
                                style: normalTextStyle,
                                isreadOnly: false,
                                isSuffixIcon: false,
                                validator: (value) {
                                  // if (value!.isEmpty) {
                                  //   print("object");
                                  //   return "this field is required";
                                  // }
                                }),
                          ],
                        ),
                        MyCheckbox(
                          titleName: accountingTxt,
                          onChanged: (value) {},
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: greyColor)),
                          child: DataTable(
                              columnSpacing: 30,
                              columns: const <DataColumn>[
                                DataColumn(label: Text('Item')),
                                DataColumn(label: Text('Brand')),
                                DataColumn(label: Text('Quantity')),
                                DataColumn(label: Text('GST')),
                                DataColumn(label: Text('Price')),
                                DataColumn(label: Text('Total')),
                                DataColumn(label: Text('Manage')),
                              ],
                              rows: controller.cartItems.map((item) {
                                double sum = (item.quantity * item.price);
                                RxDouble total =
                                    (sum + sum * item.gst / 100).obs;
                                gst() {
                                  sum = (item.quantity * item.price);
                                  total.value = (sum + sum * item.gst / 100);
                                  item.total = total.value;
                                  print(sum);
                                }

                                return DataRow(cells: [
                                  DataCell(Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    width: 150,
                                    child: TextFormField(
                                      // controller: itemController,
                                      // initialValue: item.item.toString(),
                                      onChanged: (value) {
                                        item.item = value;
                                        //  item[].name = value;
                                        //        _itemNameController.text = value;
                                        // Update the item name when user changes it
                                      },
                                    ),
                                  )),
                                  DataCell(Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    width: 150,
                                    child: TextFormField(
                                      // controller: brandController,
                                      //    initialValue: item.brand.toString(),
                                      onChanged: (value) {
                                        item.brand = value;
                                        // Update the brand when user changes it
                                      },
                                    ),
                                  )),
                                  DataCell(Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    width: 60,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      // controller: quantityController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      //    initialValue: item.quantity.toString(),
                                      onChanged: (value) {
                                        item.quantity = int.parse(value);
                                        //  total.value = item.quantity * item.price;
                                        gst();
                                        // Update the quantity when user changes it
                                      },
                                    ),
                                  )),
                                  DataCell(Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    width: 60,
                                    child: TextFormField(
                                      // controller: gstController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      //       initialValue: item.gst.toString(),
                                      onChanged: (value) {
                                        item.gst = double.parse(value);
                                        gst();
                                        // Update the GST when user changes it
                                      },
                                    ),
                                  )),
                                  DataCell(Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    width: 60,
                                    child: TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      // controller: priceController,
                                      //        initialValue: item.price.toString(),
                                      onChanged: (value) {
                                        item.price = double.parse(value);
                                        gst();
                                        controller.gettotal();
                                        // Update the price when user changes it
                                      },
                                    ),
                                  )),
                                  DataCell(Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    width: 60,
                                    child: Text(
                                      '${r"$"} ${total.value.toPrecision(2)}',
                                    ),
                                  )),
                                  DataCell(Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3),
                                      width: 120,
                                      child: ElevatedButton(
                                        child: const Text('Remove Row'),
                                        onPressed: () {
                                          controller.removeItem(item);
                                        },
                                      ))),
                                ]);
                              }).toList()),
                        ),
                        IconWithText(
                          iconData: Icons.add,
                          text: 'Add Item',
                          onPressed: () {
                            // Add new item to the cartItems list
                            final CartItem newItem = CartItem(
                                item: '',
                                brand: '',
                                quantity: 1,
                                gst: 0,
                                price: 0,
                                total: 0);
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CTextBlack(
                                      movementAmountTxt,
                                      mSize: 14,
                                    ),
                                    Text('${controller.grandtotal} INR')
                                  ],
                                ),
                                verticalSpace(10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CTextBlack(
                                      discountTxt,
                                      mSize: 14,
                                    ),
                                    Row(
                                      children: [
                                        CustomTextFormField(
                                            width: 50,
                                            // height: 30,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CTextBlack(
                                      grandTotalTxt,
                                      mSize: 16,
                                    ),
                                    Text(
                                        '${controller.cartItems.fold(0.0, (previousValue, element) => previousValue + element.total)} INR')
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
                                child: CTextBlack(remarkTxt,
                                    mSize: 15, mBold: true)),
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
                                CTextBlack(paymentMethodTxt,
                                    mSize: 14, mBold: true),
                                horizontalSpace(20),
                                CustomTextFormField(
                                  width: 250,
                                  // height: 30,
                                  controller: paymentMethodController,
                                  name: '',
                                  style: normalTextStyle,
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      print("object");
                                      return "this field is required";
                                    }
                                  },
                                ),
                                horizontalSpace(20),

                                // ),
                                horizontalSpace(20),
                                CTextBlack(acceptedTxt, mSize: 14, mBold: true),
                                horizontalSpace(20),

                                Flexible(
                                  child: MyCheckbox(
                                    titleName: "",
                                    checkedvalue: accp.value,
                                    onChanged: (value) {
                                      accp.value = value!;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        verticalSpace(20),
                        Row(
                          children: [
                            CustomButton(
                                width: 200,
                                text: cashInwardTxt,
                                onPressed: () async {
                                  // print(controller.cartItems.last.item);

                                  if (_formkey.currentState!.validate()) {
                                    Loader(false);
                                    var data = InwardEntrymodel(
                                        paymentType:
                                            paymentMethodController.text,
                                        forUnit: uniteController.text,
                                        suplierName:
                                            suppliernameController.text,
                                        shortCode: shortCodeController.text,
                                        gstRegistration: false,
                                        individual: false,
                                        accountPerson:
                                            accountablePersonController.text,
                                        city: cityController.text,
                                        address: addressController.text,
                                        country: countryController.text,
                                        dateCreated: dateCreateController.text,
                                        remark: remarkController.text,
                                        accepted: accp.value ? "yes" : "no",
                                        suplierInvoiceNo:
                                            supplierInvoiceNoController.text,
                                        item: controller.cartItems);
                                    await ApiServices()
                                        .Addinward(data)
                                        .whenComplete(() {
                                      storeController.getinwardData("");
                                      Loader(true);
                                    });
                                    print(data);
                                    Get.offAndToNamed(AppRoutes.storePage);
                                  }
                                }),
                            horizontalSpace(10),
                            CTextBlack('Or'),
                            horizontalSpace(10),
                            CTextRed('Open Store Movement', mSize: 15)
                          ],
                        )
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator())),
      ),
    ));
  }
}
