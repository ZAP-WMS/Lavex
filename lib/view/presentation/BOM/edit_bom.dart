import 'dart:js';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/model/bom_add_item.dart';
import 'package:lavex/utils/string.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../common/custom_text.dart';

import '../../../data/data_source/remote/api_service.dart';
import '../../../data/model/bomitemmodel.dart';
import '../../../data/model/getitemmodel.dart';
import '../../../datasource/bom_addItem_datasource.dart';
import '../../../utils/colors.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_scaffold.dart';
import '../../../widgets/custom_spacebar.dart';
import '../../../widgets/custom_textform.dart';
import '../../../widgets/drop_downTextField.dart';

import '../../controller/bom_additem_controller.dart';
import '../../controller/item_master_controller.dart';

class EditBomItem extends StatelessWidget {
  EditBomItem({super.key});
  TextEditingController paymentController = TextEditingController();

  final BomAddItemController controller = Get.put(BomAddItemController());
  final ItemMasterController itemMasterController =
      Get.put(ItemMasterController());

  DataGridController dataGridController = DataGridController();
  List<ItemMasterData> Itemraw = [];
  List<ItemMasterData> Itemredy = [];
  List<ItemMasterData> selectrawdata = [];
  ItemMasterData redy = ItemMasterData();
  String Stock_Status = '';
  List<GridColumn> buildColumns(BuildContext context) {
    List<GridColumn> columns = [];
    for (String columnName in bomTableName) {
      columns.add(
        GridColumn(
          columnName: columnName,
          allowEditing: columnName == 'Name' ? false : true,
          width: columnName == 'Name' || columnName == 'Client Short-Code'
              ? MediaQuery.of(context).size.width * 0.2
              : MediaQuery.of(context).size.width *
                  0.09, // You can adjust this width as needed
          label: createColumnLabel(
            bomTableName[bomTableName.indexOf(columnName)],
          ),
        ),
      );
    }
    return columns;
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

  @override
  Widget build(BuildContext context) {
    Itemraw = itemMasterController.itemMasterModel
        .where((f) => f.stockStatus == "Raw")
        .toList();
    Itemredy = itemMasterController.itemMasterModel
        .where((f) => f.stockStatus == "ReadyStock")
        .toList();
    List<BomAddItemModel> bomModel = [];
    bomModel.add(BomAddItemModel(
        title: Itemraw.isNotEmpty ? Itemraw[0].name.toString() : "",
        quantityType: Itemraw.isNotEmpty ? Itemraw[0].qtyType.toString() : "",
        quantity: (Itemraw.isNotEmpty ? Itemraw[0].qty : 0) ?? 0));

    BomAddItemDataSource bomAddItemDataSource =
        BomAddItemDataSource(bomModel, context, 'detail', Itemraw, Itemredy);

    bool isaddItem =
        controller.bomItems.isNotEmpty && controller.bomItems.last == true;
    List<String> paymentField = [
      'Name',
      'Stock Status',
    ];

    return CommonScaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: paymentField.asMap().entries.map((entry) {
              //    int index = entry.key;
              String field = entry.value;
              if (field == 'Name') {
                // Render dropdown for Client Name
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CTextBlack(field, mBold: true, mSize: 14),
                      SizedBox(
                        width: 300,
                        height: 35,
                        child: DropdownTextField<String>(
                            items: field == "raw"
                                ? Itemraw.map((f) => f.name as String).toList()
                                : Itemredy.map((f) => f.name as String)
                                    .toList(),
                            hintText: field != "raw" ? field : "",
                            itemAsString: (item) => item,
                            onChanged: (value) {
                              redy =
                                  Itemredy.firstWhere((f) => f.name == value);
                            }),
                      ),
                    ],
                  ),
                );
              } else if (field == 'Stock Status') {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CTextBlack(field, mBold: true, mSize: 14),
                      SizedBox(
                        width: 300,
                        height: 35,
                        child: DropdownTextField<String>(
                            items: ["Created", "Draft"],
                            hintText: field,
                            itemAsString: (item) => item,
                            onChanged: (value) {
                              Stock_Status = value ?? "";
                            }),
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
                    controller: paymentController,
                    style:
                        const TextStyle(), // Define your normalTextStyle here
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
            CustomButton(text: 'Download Excel', onPressed: () {}),
            horizontalSpace(10),
            CustomButton(text: 'Download Pdf', onPressed: () {})
          ]),
          verticalSpace(15),
          SfDataGridTheme(
              data: SfDataGridThemeData(
                  gridLineStrokeWidth: 2, gridLineColor: greyColor),
              child: SfDataGrid(
                  allowEditing: true,
                  selectionMode: SelectionMode.single,
                  navigationMode: GridNavigationMode.cell,
                  editingGestureType: EditingGestureType.tap,
                  gridLinesVisibility: GridLinesVisibility.both,
                  controller: dataGridController,
                  headerGridLinesVisibility: GridLinesVisibility.both,
                  source: bomAddItemDataSource,
                  columns: buildColumns(context))),

          // CTextBlack('WareHouse Product Details'),
          // Container(
          //   alignment: Alignment.centerLeft,
          //   padding: const EdgeInsets.all(10),
          //   decoration: BoxDecoration(border: Border.all(color: greyColor)),
          //   child: Obx(() => DataTable(
          //       columnSpacing: 30,
          //       columns: const <DataColumn>[
          //         DataColumn(label: Text('Item', textAlign: TextAlign.center)),
          //         DataColumn(
          //             label:
          //                 Text('Quantity Type', textAlign: TextAlign.center)),
          //         DataColumn(
          //             label: Text('Quantity', textAlign: TextAlign.center)),
          //         DataColumn(
          //             label: Text('Action', textAlign: TextAlign.center)),
          //       ],
          //       rows: controller.bomItems.asMap().entries.map((entry) {
          //         int index = entry.key;
          //         BomAddItemModel item = entry.value;
          //         //bool isLastItem = indexx == controller.bomItems.length - 1;
          //         //  print('isLast : $item $isLastItem');
          //         return dataRow(index);
          //       }).toList())),
          // ),
          // IconWithText(
          //   iconData: Icons.add,
          //   text: 'Add Item',
          //   onPressed: () {
          //     // Add new item to the cartItems list
          //     BomAddItemModel newItem = BomAddItemModel(
          //       title: 'title',
          //       quantityType: 'quantityType',
          //       quantity: 1,
          //     );
          //     controller.addItem(newItem);
          //     print(selectrawdata.length);
          //   },
          // ),

          verticalSpace(10),
          Container(
              width: 100,
              child: CustomButton(
                  text: 'Save',
                  onPressed: () {
                    try {
                      // Map<String, dynamic> getdata = Map();
                      selectrawdata.clear();
                      for (var i in bomAddItemDataSource.dataGridRows) {
                        int index = Itemraw.indexWhere(
                            (element) => element.name == i.getCells()[0].value);
                        Itemraw[index].qty =
                            int.parse(i.getCells()[2].value.toString());
                        selectrawdata.add(Itemraw.firstWhere((element) =>
                            element.name == i.getCells()[0].value));
                        print(selectrawdata);
                      }
                      print(selectrawdata.length);
                      //     .getCells()[0]
                      //     .value);

                      print(selectrawdata.map((e) => e.name).toList());
                      List<ReadyStock> rawitem = [];
                      selectrawdata.forEach((x) {
                        rawitem.add(ReadyStock.fromJson(x.toJson()));
                      });

                      print(selectrawdata.length);

                      BomitemModel data = BomitemModel(
                          readyStock: ReadyStock.fromJson(redy.toJson()),
                          raw: rawitem,
                          status: Stock_Status);
                      ApiServices()
                          .AddBom(data)
                          .whenComplete(() => {controller.getallBom()});
                    } on Exception catch (e) {
                      Get.snackbar("Error", e.toString());
                      // TODO
                    }
                  })),
        ],
      ),
    ));
  }

  // DataRow dataRow(int indexx) {
  //   TextEditingController type = TextEditingController();
  //   TextEditingController qty = TextEditingController();
  //   return DataRow(cells: [
  //     DataCell(Container(
  //       padding: const EdgeInsets.symmetric(vertical: 3),
  //       width: 200,
  //       child: !selectrawdata[indexx].isNull
  //           ? DropdownTextField<String>(
  //               items: Itemraw.map((f) => f.name as String).toList(),
  //               hintText: "",
  //               initialValue: !selectrawdata[indexx].isNull
  //                   ? selectrawdata[indexx]!.name.toString() ?? ""
  //                   : "",
  //               itemAsString: (item) => item,
  //               onChanged: (value) {
  //                 selectrawdata.addIf(
  //                     true, indexx, Itemraw.firstWhere((f) => f.name == value));
  //                 type.text = selectrawdata[indexx]!.qtyType.toString();
  //               })
  //           : DropdownTextField<String>(
  //               items: Itemraw.map((f) => f.name as String).toList(),
  //               hintText: "",
  //               itemAsString: (item) => item,
  //               onChanged: (value) {
  //                 selectrawdata.addIf(
  //                     true, indexx, Itemraw.firstWhere((f) => f.name == value));
  //                 type.text = selectrawdata[indexx]!.qtyType.toString();
  //               }),
  //     )),
  //     DataCell(Container(
  //       padding: const EdgeInsets.symmetric(vertical: 3),
  //       width: 200,
  //       child: TextFormField(
  //         enabled: false,
  //         controller: type,
  //         // initialValue: !selectrawdata[indexx].isNull
  //         //     ? selectrawdata[indexx]!.qtyType.toString() ?? ""
  //         //     : "",
  //         onChanged: (value) {
  //           // Update the brand when user changes it
  //         },
  //       ),
  //     )),
  //     DataCell(Container(
  //       padding: const EdgeInsets.symmetric(vertical: 3),
  //       width: 200,
  //       child: TextFormField(
  //         controller: qty,
  //         // initialValue: !selectrawdata[indexx].isNull
  //         //     ? selectrawdata[indexx]!.qty.toString() ?? ""
  //         //     : "",
  //         onChanged: (value) {
  //           selectrawdata[indexx]!.qty = int.parse(value);
  //         },
  //       ),
  //     )),
  //     DataCell(Container(
  //         padding: const EdgeInsets.symmetric(vertical: 3),
  //         width: 200,
  //         child: GestureDetector(
  //             onTap: () {
  //               controller.removeItem(indexx);
  //             },
  //             child: CTextBlack('Remove Row', mSize: 15, mBold: false)))),
  //   ]);
  // }
}
