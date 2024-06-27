import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/common/custom_text.dart';
import 'package:lavex/datasource/create_invoice_datasource.dart';
import 'package:lavex/utils/colors.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/view/controller/cartItem_controller.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_checkbox.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import 'package:lavex/widgets/custom_textform.dart';
import 'package:lavex/widgets/cutom_textformfield.dart';
import 'package:lavex/widgets/icon_with_text.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../data/model/cart_item.dart';
import '../../../../utils/style.dart';

class PromaForm extends GetView<CartController> {
  String? pageTitle;
  final List<CartItem>? cartItems;
  PromaForm({super.key, this.cartItems, this.pageTitle});

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

  List<GridColumn> columns = [];
  late CreateInvoiceDatasource _createInvoiceDatasource;
  final List<CartItem> _cartdata = [];

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());
    // ignore: use_build_context_synchronously
    _createInvoiceDatasource = CreateInvoiceDatasource(_cartdata, context, '');

    columns.clear();
    for (String columnName in createInvoiceTable) {
      columns.add(
        GridColumn(
          columnName: columnName,
          visible: true,
          allowEditing:
              columnName == 'Total' || columnName == 'Gst' ? false : true,
          width: MediaQuery.of(context).size.width *
              0.09, // You can adjust this width as needed
          label: createColumnLabel(
            createInvoiceTable[createInvoiceTable.indexOf(columnName)],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
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
                        name: clientTxt,
                        controller: clientController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,  
                        validator: (value) {}),
                    horizontalSpace(10),    
                    customAlertDialog(context, clientController)
                  ],
                ),
                CustomField(
                    width: 300,
                    height: 40,
                    name: addressTxt,
                    controller: addressController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: pageTitle,
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
                    name: shortCodeTxt,
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
                    name: '${increaseFormaTxt} $pageTitle',
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
                    name: toShipedTxt,
                    controller: toShippedController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: stateTxt,
                    controller: stateController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: dateTxt,
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
                    name: forToShipped,
                    controller: forToShippedController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: stateCodeTxt,
                    controller: stateCodeController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: dueDateTxt,
                    controller: dueDateController,
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
                    name: selectedCurrencyTxt,
                    controller: selectedCurrencyController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: countryTxt,
                    controller: countryController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: poTxt,
                    controller: poNoController,
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
                    name: indicatingMaturityTxt,
                    controller: maturityDateController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: deliveryChallanTxt,
                    controller: delieveryChallanController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                MyCheckbox(
                  width: 300,
                  titleName: indicatingMaturityTxt,
                  onChanged: (value) {},
                ),
              ],
            ),
            MyCheckbox(
              titleName: accountingTxt,
              onChanged: (value) {},
            ),

            // Container(
            //   alignment: Alignment.centerLeft,
            //   padding: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(border: Border.all(color: greyColor)),
            //   child: Obx(
            //     () => DataTable(
            //         columnSpacing: 30,
            //         columns: const <DataColumn>[
            //           DataColumn(label: Text('Item')),
            //           DataColumn(label: Text('Brand')),
            //           DataColumn(label: Text('Quantity')),
            //           DataColumn(label: Text('GST')),
            //           DataColumn(label: Text('Price')),
            //           DataColumn(label: Text('Total')),
            //         ],
            //         rows: [
            //           DataRow(
            //               cells: List.generate(6, (index) {
            //             return DataCell(Container(
            //               padding: const EdgeInsets.symmetric(vertical: 3),
            //               width: (index == 0) || (index == 1) ? 150 : 60,
            //               child: TextFormField(
            //                 decoration: const InputDecoration(),
            //                 onChanged: (value) {
            //                   // Handle onChanged event
            //                 },
            //               ),
            //             ));
            //           }))
            //         ]..addAll(controller.cartItems.map((item) {
            //             return DataRow(cells: [
            //               DataCell(Container(
            //                 padding: const EdgeInsets.symmetric(vertical: 3),
            //                 width: 150,
            //                 child: TextFormField(
            //                   controller: itemController,
            //                   // initialValue: item.item.toString(),
            //                   onChanged: (value) {
            //                     //        _itemNameController.text = value;
            //                     // Update the item name when user changes it
            //                   },
            //                 ),
            //               )),
            //               DataCell(Container(
            //                 padding: const EdgeInsets.symmetric(vertical: 3),
            //                 width: 150,
            //                 child: TextFormField(
            //                   controller: brandController,
            //                   //    initialValue: item.brand.toString(),
            //                   onChanged: (value) {
            //                     // Update the brand when user changes it
            //                   },
            //                 ),
            //               )),
            //               DataCell(Container(
            //                 padding: const EdgeInsets.symmetric(vertical: 3),
            //                 width: 60,
            //                 child: TextFormField(
            //                   controller: quantityController,
            //                   //    initialValue: item.quantity.toString(),
            //                   onChanged: (value) {
            //                     // Update the quantity when user changes it
            //                   },
            //                 ),
            //               )),
            //               DataCell(Container(
            //                 padding: const EdgeInsets.symmetric(vertical: 3),
            //                 width: 60,
            //                 child: TextFormField(
            //                   controller: gstController,
            //                   //       initialValue: item.gst.toString(),
            //                   onChanged: (value) {
            //                     // Update the GST when user changes it
            //                   },
            //                 ),
            //               )),
            //               DataCell(Container(
            //                 padding: const EdgeInsets.symmetric(vertical: 3),
            //                 width: 60,
            //                 child: TextFormField(
            //                   controller: priceController,
            //                   //        initialValue: item.price.toString(),
            //                   onChanged: (value) {
            //                     // Update the price when user changes it
            //                   },
            //                 ),
            //               )),
            //               DataCell(Container(
            //                 padding: const EdgeInsets.symmetric(vertical: 3),
            //                 width: 60,
            //                 child: Text(
            //                   '\$${(item.price * item.quantity).toStringAsFixed(2)}',
            //                 ),
            //               )),
            //             ]);
            //           }).toList())),
            //   ),
            // ),
            SfDataGrid(
              allowEditing: true,
              editingGestureType: EditingGestureType.tap,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.both,
              selectionMode: SelectionMode.single,
              navigationMode: GridNavigationMode.cell,
              columnWidthMode: ColumnWidthMode.auto,
              source: _createInvoiceDatasource,
              columns: columns,
            ),
            IconWithText(
              iconData: Icons.add,
              text: 'Add Item',
              onPressed: () {
                // Add new item to the cartItems list
                _cartdata.add(CartItem(
                    item: 'item',
                    brand: 'Lavex',
                    quantity: 10,
                    gst: 18.00,
                    price: 15,
                    total: 150.00));
                // controller.addItem(newItem);
                _createInvoiceDatasource.buildDataGridRows();
                _createInvoiceDatasource.updateDatagridSource();
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
                          invoiceAmountTxt,
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
                    )
                  ],
                ),
              ],
            ),
            verticalSpace(20),
            CustomButton(width: 200, text: createTxt, onPressed: () {})
          ],
        ),
      ),
    );
  }

  customAlertDialog(context, TextEditingController controller) {
    List<String> clientlist = [
      'data1',
      'data2',
      'data3',
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: greyColor,
        child: IconButton(
          icon: const Icon(Icons.search),
          iconSize: 15,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Select Client From List'),
                    content: SizedBox(
                      width: 500, // Set width to maximum
                      height: 500,
                      child: ListView.builder(
                        itemCount: clientlist.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text(clientlist[index]),
                              onTap: () {
                                String selectedClient =
                                    clientlist[index].toString();
                                controller.text = selectedClient;

                                // Handle onTap action for each item if needed
                                Navigator.of(context).pop(
                                    'Item $index'); // Example: Pop the selected item
                              });
                        },
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }

  Widget createColumnLabel(String labelText) {
    return Container(
      alignment: Alignment.center,
      child: Text(labelText,
          overflow: TextOverflow.values.first,
          textAlign: TextAlign.center,
          style: tableheader),
    );
  }
}
