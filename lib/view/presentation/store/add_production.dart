import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/model/getallinwardentrymodel.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../common/custom_text.dart';
import '../../../data/data_source/remote/api_service.dart';
import '../../../data/model/add_productionModel.dart';
import '../../../data/model/bom_add_item.dart';
import '../../../data/model/cart_item.dart';
import '../../../data/model/getallBom.dart' as bom;
import '../../../datasource/addproductiondatasource.dart';
import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_checkbox.dart';
import '../../../widgets/custom_spacebar.dart';
import '../../../widgets/custom_textform.dart';
import '../../../widgets/cutom_textformfield.dart';
import '../../../widgets/drop_downTextField.dart';
import '../../../widgets/icon_with_text.dart';
import '../../controller/bom_additem_controller.dart';
import '../../controller/production_controller.dart';
import '../Invoice/myinvoice/myInvoice..dart';

class AddProduction extends GetView<ProductionController> {
  AddProduction({super.key});

  final TextEditingController clientController = TextEditingController(
      text:
          "${DateTime.now().day.toString()}-${DateTime.now().month.toString()}-${DateTime.now().year.toString()}");
  final TextEditingController addressController = TextEditingController();
  final TextEditingController invoiceController = TextEditingController();
  // final TextEditingController shortCodeController = TextEditingController();
  // final TextEditingController cityController = TextEditingController();
  // final TextEditingController increaseInvoiceController =
  //     TextEditingController();
  // final TextEditingController toShippedController = TextEditingController();
  // final TextEditingController stateController = TextEditingController();
  // final TextEditingController invoiceDateController = TextEditingController();
  // final TextEditingController forToShippedController = TextEditingController();
  // final TextEditingController stateCodeController = TextEditingController();
  // final TextEditingController dueDateController = TextEditingController();
  // final TextEditingController selectedCurrencyController =
  //     TextEditingController();
  // final TextEditingController countryController = TextEditingController();
  // final TextEditingController poNoController = TextEditingController();
  // final TextEditingController maturityDateController = TextEditingController();
  // final TextEditingController delieveryChallanController =
  //     TextEditingController();
  // final TextEditingController discountController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();
  // final TextEditingController paymentMethodController = TextEditingController();

  // table controller
  // final TextEditingController itemController = TextEditingController();
  // final TextEditingController brandController = TextEditingController();
  // final TextEditingController quantityController = TextEditingController();
  // final TextEditingController gstController = TextEditingController();
  // final TextEditingController priceController = TextEditingController();
  // final TextEditingController totalController = TextEditingController();
  late Addproductiondatasource _bomDataSource;
  DataGridController _dataGridController = DataGridController();
  BomAddItemController list = Get.put(BomAddItemController());
  List<GridColumn> columns = [];

  @override
  Widget build(BuildContext context) {
    _bomDataSource = Addproductiondatasource(
        [
          BomAddItemModel(
              title: list.listAllbom.isNotEmpty
                  ? list.listAllbom[0].readyStock!.name.toString()
                  : "",
              quantityType: list.listAllbom.isNotEmpty
                  ? list.listAllbom[0].readyStock!.qtyType.toString()
                  : "",
              quantity: (list.listAllbom.isNotEmpty
                      ? list.listAllbom[0].readyStock!.qty
                      : 0) ??
                  0)
        ],
        context,
        'userId',
        list.listAllbom,
        []);
    final ProductionController controller = Get.put(ProductionController());

    for (String columnName in bomTableTitle) {
      columns.add(
        GridColumn(
          columnName: columnName,
          visible: true,
          allowEditing: true,
          width: columnName == 'Name' || columnName == 'Store'
              ? MediaQuery.of(context).size.width * 0.2
              : MediaQuery.of(context).size.width *
                  0.09, // You can adjust this width as needed
          label: createColumnLabel(
            bomTableTitle[bomTableTitle.indexOf(columnName)],
          ),
        ),
      );
    }

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
                          name: "Create Date",
                          controller: clientController,
                          style: normalTextStyle,
                          isreadOnly: false,
                          isSuffixIcon: false,
                          validator: (value) {}),
                      //    customAlertDialog(context, clientController)
                    ],
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    child: Obx(() => MyCheckbox(
                          titleName: individualTxt,
                          checkedvalue: controller.accp.value,
                          onChanged: (value) {
                            controller.toggleCheckedValue("Individual", value);
                          },
                        )),
                  )
                ],
              ),
              // verticalSpace(10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     CustomField(
              //         width: 300,
              //         height: 40,
              //         name: supplierName,
              //         controller: shortCodeController,
              //         style: normalTextStyle,
              //         isreadOnly: false,
              //         isSuffixIcon: false,
              //         validator: (value) {}),
              //     CustomField(
              //         width: 300,
              //         height: 40,
              //         name: cityTxt,
              //         controller: cityController,
              //         style: normalTextStyle,
              //         isreadOnly: false,
              //         isSuffixIcon: false,
              //         validator: (value) {}),
              //     CustomField(
              //         width: 300,
              //         height: 40,
              //         name: dateCreateFromTxt,
              //         controller: increaseInvoiceController,
              //         style: normalTextStyle,
              //         isreadOnly: false,
              //         isSuffixIcon: false,
              //         validator: (value) {}),
              //   ],
              // ),
              // verticalSpace(10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     CustomField(
              //         width: 300,
              //         height: 40,
              //         name: shortCodeTxt,
              //         controller: toShippedController,
              //         style: normalTextStyle,
              //         isreadOnly: false,
              //         isSuffixIcon: false,
              //         validator: (value) {}),
              //     CustomField(
              //         width: 300,
              //         height: 40,
              //         name: addressTxt,
              //         controller: stateController,
              //         style: normalTextStyle,
              //         isreadOnly: false,
              //         isSuffixIcon: false,
              //         validator: (value) {}),
              //     CustomField(
              //         width: 300,
              //         height: 40,
              //         name: supplierInvoiceNo,
              //         controller: invoiceDateController,
              //         style: normalTextStyle,
              //         isreadOnly: false,
              //         isSuffixIcon: false,
              //         validator: (value) {}),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     CustomField(
              //         width: 300,
              //         height: 40,
              //         name: countryTxt,
              //         controller: stateCodeController,
              //         style: normalTextStyle,
              //         isreadOnly: false,
              //         isSuffixIcon: false,
              //         validator: (value) {}),
              //     CustomField(
              //         width: 300,
              //         height: 40,
              //         name: selectedCurrencyTxt,
              //         controller: selectedCurrencyController,
              //         style: normalTextStyle,
              //         isreadOnly: false,
              //         isSuffixIcon: false,
              //         validator: (value) {}),
              //   ],
              // ),
              // MyCheckbox(
              //   titleName: accountingTxt,
              //   onChanged: (value) {},
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(border: Border.all(color: greyColor)),
                    child: SfDataGridTheme(
                        data: SfDataGridThemeData(
                            gridLineStrokeWidth: 2, gridLineColor: greyColor),
                        child: SfDataGrid(
                            showCheckboxColumn: true,
                            checkboxShape: const CircleBorder(),
                            allowFiltering: false,
                            allowEditing: true,
                            allowSorting: true,
                            selectionMode: SelectionMode.multiple,
                            gridLinesVisibility: GridLinesVisibility.both,
                            controller: _dataGridController,
                            headerGridLinesVisibility: GridLinesVisibility.both,
                            source: _bomDataSource,
                            columns: columns))),
              ),
              // IconWithText(
              //   iconData: Icons.add,
              //   text: 'Add Item',
              //   onPressed: () {
              //     // Add new item to the cartItems list
              //     final CartItem newItem = CartItem(
              //         item: 'item',
              //         brand: 'brand',
              //         quantity: 1,
              //         gst: 18.00,
              //         price: 15,
              //         total: 15.00);
              //     controller.addItem(newItem);
              //   },
              // ),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: Container(
              //     width: 300,
              //     padding: const EdgeInsets.symmetric(horizontal: 20),
              //     child: Column(
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             CTextBlack(
              //               movementAmountTxt,
              //               mSize: 14,
              //             ),
              //             const Text('0.00 INR')
              //           ],
              //         ),
              //         verticalSpace(10),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             CTextBlack(
              //               discountTxt,
              //               mSize: 14,
              //             ),
              //             Row(
              //               children: [
              //                 CustomTextFormField(
              //                     width: 50,
              //                     height: 30,
              //                     controller: discountController,
              //                     name: '0.00',
              //                     validator: (p0) {},
              //                     style: normalTextStyle),
              //                 const Text('0.00 INR')
              //               ],
              //             )
              //           ],
              //         ),
              //         verticalSpace(10),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             CTextBlack(
              //               taxIncludeTxt,
              //               mSize: 14,
              //             ),
              //             const Text('0.00 INR')
              //           ],
              //         ),
              //         verticalSpace(20),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             CTextBlack(
              //               grandTotalTxt,
              //               mSize: 16,
              //             ),
              //             const Text('0.00 INR')
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
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
              //     verticalSpace(20),
              //     Row(
              //       children: [
              //         CTextBlack(paymentMethodTxt, mSize: 14, mBold: true),
              //         horizontalSpace(20),
              //         CustomTextFormField(
              //           width: 250,
              //           height: 30,
              //           controller: paymentMethodController,
              //           name: '',
              //           style: normalTextStyle,
              //           validator: (p0) {},
              //         ),
              //         horizontalSpace(20),
              //         CTextBlack(betrayedTxt, mSize: 14, mBold: true),
              //         horizontalSpace(20),
              //         Container(
              //           width: 250,
              //           height: 30,
              //           child: DropdownTextField(
              //             items: ["Cash"],
              //             onChanged: (String? value) {},
              //             itemAsString: (item) => item,
              //             hintText: '',
              //           ),
              //         ),
              //         horizontalSpace(20),
              //         CTextBlack(acceptedTxt, mSize: 14, mBold: true),
              //         horizontalSpace(20),
              //         CustomTextFormField(
              //           width: 250,
              //           height: 30,
              //           controller: paymentMethodController,
              //           name: '',
              //           style: normalTextStyle,
              //           validator: (p0) {},
              //         )
              //       ],
              //     ),
              //   ],
              // ),
              verticalSpace(20),
              Row(
                children: [
                  CustomButton(
                      width: 210,
                      text: createProductionTxt,
                      onPressed: () {
                        List<bom.Allbom> selectrawdata = [];

                        for (var i in _bomDataSource.dataGridRows) {
                          int index = list.listAllbom.indexWhere((element) =>
                              element.readyStock!.name ==
                              i.getCells()[0].value);
                          list.listAllbom[index].readyStock!.qty =
                              int.parse(i.getCells()[2].value.toString());

                          selectrawdata.add(list.listAllbom.firstWhere(
                              (element) =>
                                  element.readyStock!.name ==
                                  i.getCells()[0].value));
                          print(selectrawdata);
                        }
                        List<Raw> listraw = [];

                        selectrawdata.forEach((e) => {
                              e.raw!.forEach((element) {
                                listraw.add(Raw(
                                    name: element.name,
                                    quantity: element.qty,
                                    brand: element.brand,
                                    price: element.price,
                                    gst: element.gst));
                              })
                            });
                        ;
                        List<ReadyStock> listredy = selectrawdata
                            .map((e) =>
                                ReadyStock.fromJson(e.readyStock!.toJson()))
                            .toList();
                        print(listredy);
                        print(listraw);
                        // listredy.add(ReadyStock.fromJson({
                        //   "name": "foil5",
                        //   "qty": 10,
                        //   "price": 100,
                        //   "gst": 18,
                        //   "brand": "brand2"
                        // }));
                        // listredy.add(ReadyStock.fromJson({
                        //   "name": "foil1",
                        //   "qty": 10,
                        //   "price": 100,
                        //   "gst": 18,
                        //   "brand": "brand2"
                        // }));
                        // List<Raw> listRaw = [];

                        // listRaw.add(Raw.fromJson({
                        //   "name": "foil5",
                        //   "quantity": 5,
                        //   "price": 100,
                        //   "brand": "brand2",
                        //   "gst": 18
                        // }));
                        addProductionModel model = addProductionModel(
                            accepted: "yes",
                            remark: "Abc",
                            dateCreated: "12-02-2005",
                            readyStock: listredy,
                            raw: listraw);
                        ApiServices().Addproduction(model);
                      }),
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
