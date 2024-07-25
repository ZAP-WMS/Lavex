import 'dart:js';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/model/bom_add_item.dart';
import 'package:lavex/utils/string.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../common/custom_text.dart';

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

class BomAddItem extends StatelessWidget {
  BomAddItem({super.key});
  TextEditingController paymentController = TextEditingController();

  final BomAddItemController controller = Get.put(BomAddItemController());

  final ItemMasterController itemMasterController =
      Get.put(ItemMasterController());

  DataGridController dataGridController = DataGridController();
  List<itemData> Itemraw = [];
  List<itemData> Itemredy = [];
  Map<int, itemData> selectrawdata = {};
  itemData redy = itemData();
  @override
  Widget build(BuildContext context) {
    List<BomAddItemModel> bomModel = [];
    bomModel
        .add(BomAddItemModel(title: 'title', quantityType: '', quantity: 2));

    BomAddItemDataSource bomAddItemDataSource =
        BomAddItemDataSource(bomModel, context, '');

    bool isaddItem =
        controller.bomItems.isNotEmpty && controller.bomItems.last == true;
    List<String> paymentField = [
      'Name',
      'Stock Status',
    ];

    Itemraw = itemMasterController.itemMasterModel
        .where((f) => f.stockStatus == "Raw")
        .toList();
    Itemredy = itemMasterController.itemMasterModel
        .where((f) => f.stockStatus == "ReadyStock")
        .toList();

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
                                  ? Itemraw.map((f) => f.name as String)
                                      .toList()
                                  : Itemredy.map((f) => f.name as String)
                                      .toList(),
                              hintText: field != "raw" ? field : "",
                              itemAsString: (item) => item,
                              onChanged: (value) {
                                redy =
                                    Itemredy.firstWhere((f) => f.name == value);
                              })),
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
                            onChanged: (value) {}),
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
                    // print(selectrawdata.entries.map((e) => e.value.qty));
                    // bomitemModel data = bomitemModel(
                    //     readyStock: redy, raw: selectrawdata.values.toList());
                    // ApiServices().AddBom(data);
                  })),
        ],
      ),
    ));
  }

  DataRow Datarow(int indexx) {
    TextEditingController type = TextEditingController();
    TextEditingController qty = TextEditingController();
    return DataRow(cells: [
      DataCell(Container(
        padding: const EdgeInsets.symmetric(vertical: 3),
        width: 200,
        child: !selectrawdata[indexx].isNull
            ? DropdownTextField<String>(
                items: Itemraw.map((f) => f.name as String).toList(),
                hintText: "",
                initialValue: !selectrawdata[indexx].isNull
                    ? selectrawdata[indexx]!.name.toString() ?? ""
                    : "",
                itemAsString: (item) => item,
                onChanged: (value) {
                  selectrawdata.addIf(
                      true, indexx, Itemraw.firstWhere((f) => f.name == value));
                  type.text = selectrawdata[indexx]!.qtyType.toString();
                })
            : DropdownTextField<String>(
                items: Itemraw.map((f) => f.name as String).toList(),
                hintText: "",
                itemAsString: (item) => item,
                onChanged: (value) {
                  selectrawdata.addIf(
                      true, indexx, Itemraw.firstWhere((f) => f.name == value));
                  type.text = selectrawdata[indexx]!.qtyType.toString();
                }),
      )),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(vertical: 3),
        width: 200,
        child: TextFormField(
          enabled: false,
          controller: type,
          // initialValue: !selectrawdata[indexx].isNull
          //     ? selectrawdata[indexx]!.qtyType.toString() ?? ""
          //     : "",
          onChanged: (value) {
            // Update the brand when user changes it
          },
        ),
      )),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(vertical: 3),
        width: 200,
        child: TextFormField(
          controller: qty,
          // initialValue: !selectrawdata[indexx].isNull
          //     ? selectrawdata[indexx]!.qty.toString() ?? ""
          //     : "",
          onChanged: (value) {
            selectrawdata[indexx]!.qty = int.parse(value);
          },
        ),
      )),
      DataCell(Container(
          padding: const EdgeInsets.symmetric(vertical: 3),
          width: 200,
          child: CTextBlack('Remove Row', mSize: 15, mBold: false))),
    ]);
  }
}
