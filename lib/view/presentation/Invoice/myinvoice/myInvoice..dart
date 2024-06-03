import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/common/custom_text.dart';
import 'package:lavex/utils/colors.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/view/controller/cartItem_controller.dart';
import 'package:lavex/view/controller/invoice_controller.dart';
import 'package:lavex/widgets/custom_checkbox.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import 'package:lavex/widgets/custom_textform.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../data/model/cart_item.dart';
import '../../../../data/model/my_invoice_model.dart';
import '../../../../datasource/myInvoice_datasource.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../../utils/style.dart';
import '../../../../widgets/custom_button.dart';

class MyInvoiceList extends GetView<InvoiceController> {
  String? pageTitle;
  final List<CartItem>? cartItems;
  MyInvoiceList({super.key, this.cartItems, this.pageTitle});

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

  //Datasource FIle
  late MyInvoiceDatasource _invoiceDatasource;
  late DataGridController _dataGridController;
  List<MyInvoiceModel> invoiceModel = [];

  final ScrollController scrollController = ScrollController();

  List<GridColumn> columns = [];
  List<List<String>> tabColumnNames = [myInvoiceTableName];

  List<List<String>> tabColumnLabels = [
    myInvoiceTableName,

    // Labels for tab 1
    // Labels for tab 2
  ];

  @override
  Widget build(BuildContext context) {
    final InvoiceController controller = Get.put(InvoiceController());
    invoiceModel.add(MyInvoiceModel(
        number: '1',
        date: 'date',
        clientName: 'clientName',
        type: 'type',
        status: 'status',
        gst: 'gst',
        total: 122.5,
        options: 'options'));
    invoiceModel.add(MyInvoiceModel(
        number: '2',
        date: 'fdf',
        clientName: 'clienffftName',
        type: 'fff',
        status: 'ggggf',
        gst: 'sss',
        total: 122.5,
        options: 'eere'));
    _invoiceDatasource = MyInvoiceDatasource(invoiceModel, context, 'userId');
    _dataGridController = DataGridController();

    List<String> currentColumnNames = tabColumnNames[0];
    List<String> currentColumnLabels = tabColumnLabels[0];
    columns.clear();
    for (String columnName in currentColumnNames) {
      columns.add(
        GridColumn(
          columnName: columnName,
          visible: true,

          allowEditing: columnName == 'Add' ||
                  columnName == 'Delete' ||
                  columnName == columnName[0]
              ? false
              : true,
          width: columnName == 'Client Name'
              ? MediaQuery.of(context).size.width * 0.14
              : MediaQuery.of(context).size.width *
                  0.09, // You can adjust this width as needed
          label: createColumnLabel(
            currentColumnLabels[currentColumnNames.indexOf(columnName)],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: greyColor)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10),
                // SizedBox(
                //   height: 40,
                //   child: ListView.builder(
                //     itemCount: myInvoiceTabTitle.length,
                //     scrollDirection: Axis.horizontal,
                //     controller: scrollController,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //           padding: const EdgeInsets.all(3.0),
                //           child: GestureDetector(
                //             onTap: () {
                //               controller.currentIndex.value = index;
                //             },
                //             child: Container(
                //               height: 50,
                //               padding: const EdgeInsets.symmetric(
                //                   horizontal: 5, vertical: 3),
                //               decoration: BoxDecoration(
                //                   color: controller.currentIndex.value == index
                //                       ? appColor
                //                       : greyColor,
                //                   borderRadius: BorderRadius.circular(5)),
                //               child: Row(
                //                 children: [
                //                   Icon(Icons.home_max_outlined, color: whiteColor),
                //                   horizontalSpace(10),
                //                   CTextWhite(myInvoiceTabTitle[index], mSize: 14)
                //                 ],
                //               ),
                //             ),
                //           ));
                //     },
                //   ),
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomField(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: 40,
                            name: invoiceNoTxt,
                            controller: clientController,
                            style: normalTextStyle,
                            isreadOnly: false,
                            isSuffixIcon: false,
                            validator: (value) {}),
                      ],
                    ),
                    CustomField(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 40,
                        name: clientTxt,
                        controller: addressController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {}),
                    CustomField(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 40,
                        name: itemTxt,
                        controller: invoiceController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {}),
                    CustomField(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 40,
                        name: paymentTypeTxt,
                        controller: invoiceController,
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
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 40,
                        name: amountFromTxt,
                        controller: shortCodeController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {}),
                    CustomField(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 40,
                        name: toTxt,
                        controller: cityController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {}),
                    CustomField(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 40,
                        name: dateCreateFromTxt,
                        controller: increaseInvoiceController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {}),
                    CustomField(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 40,
                        name: toTxt,
                        controller: increaseInvoiceController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {}),
                  ],
                ),
                verticalSpace(10),
                CTextBlack('Type', mSize: 14, mBold: true),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: createInvoice.length,
                    itemBuilder: (context, index) {
                      return MyCheckbox(
                        width: 200,
                        titleName: createInvoice[index],
                        onChanged: (value) {},
                      );
                    },
                  ),
                ),
                verticalSpace(10),
                CTextBlack('Payments', mSize: 14, mBold: true),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: paymentsList.length,
                    itemBuilder: (context, index) {
                      return MyCheckbox(
                        width: 200,
                        titleName: paymentsList[index],
                        onChanged: (value) {},
                      );
                    },
                  ),
                ),
                verticalSpace(10),
                CTextBlack('Status', mSize: 14, mBold: true),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: statusList.length,
                    itemBuilder: (context, index) {
                      return MyCheckbox(
                        width: 200,
                        titleName: statusList[index],
                        onChanged: (value) {},
                      );
                    },
                  ),
                ),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomButton(
                          text: 'Search',
                          onPressed: () {},
                        ),
                        horizontalSpace(20),
                        CustomButton(
                          text: 'Clear Search',
                          onPressed: () {},
                        )
                      ],
                    ),
                    CustomButton(
                      text: 'Delete',
                      onPressed: () {
                        final selectedRows = _dataGridController.selectedRows;
                        // final selectedIndices = selectedRows.map((row) {
                        //   return _invoiceDatasource.rows.indexOf(row);
                        // }).toList();

                        // // Sort the indices in descending order
                        // selectedIndices.sort((a, b) => b.compareTo(a));
                        final selectedInvoiceNos = selectedRows.map((row) {
                          return row
                              .getCells()
                              .firstWhere((cell) => cell.columnName == 'number')
                              .value
                              .toString();
                        }).toList();
                        print(selectedInvoiceNos);
                        for (String invoiceNo in selectedInvoiceNos) {
                          _invoiceDatasource.removeRowByInvoiceNo(invoiceNo);
                        }
                        _dataGridController.selectedRows.clear();
                      },
                    ),
                  ],
                ),
                verticalSpace(10),
                SfDataGridTheme(
                    data: SfDataGridThemeData(
                        gridLineStrokeWidth: 2, gridLineColor: greyColor),
                    child: SfDataGrid(
                        showCheckboxColumn: true,
                        checkboxShape: const CircleBorder(),
                        allowFiltering: false,
                        allowSorting: true,
                        selectionMode: SelectionMode.multiple,
                        gridLinesVisibility: GridLinesVisibility.both,
                        controller: _dataGridController,
                        headerGridLinesVisibility: GridLinesVisibility.both,
                        source: _invoiceDatasource,
                        columns: columns))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _deleteSelectedRows() {
    final selectedRows = _dataGridController.selectedRows;
    for (var row in selectedRows) {
      final num = row
          .getCells()
          .firstWhere((cell) => cell.columnName == 'number')
          .value;
      invoiceModel.removeWhere((employee) => employee.number == num);
    }
    _dataGridController.selectedRows.clear();
    _invoiceDatasource.updateDatagridSource();
  }
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
