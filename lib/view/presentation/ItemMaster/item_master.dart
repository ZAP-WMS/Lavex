import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/datasource/itemMaster_datasource.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/utils/style.dart';
import 'package:lavex/view/controller/item_master_controller.dart';
import 'package:lavex/view/presentation/ItemMaster/add_Item.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../common/custom_text.dart';
import '../../../utils/asset_image.dart';
import '../../../utils/colors.dart';
import '../../../widgets/custom_button.dart';

class ItemMaster extends GetView<ItemMasterController> {
  ItemMaster({super.key});
  TextEditingController nameController = TextEditingController();

  late ItemMasterDataSource itemMasterDataSource;
  final ScrollController scrollController = ScrollController();
  List<Widget> tabClass = [
    AddItemMaster(),
  ];
  final ItemMasterController itemMasterController =
      Get.put(ItemMasterController());

  List<GridColumn> buildColumns(BuildContext context) {
    List<GridColumn> columns = [];
    for (String columnName in itemMasterTableName) {
      columns.add(
        GridColumn(
          columnName: columnName,
          visible: true,
          allowEditing: columnName == 'Add' ||
                  columnName == 'Delete' ||
                  columnName == columnName[0]
              ? false
              : true,
          width: columnName == 'Name' || columnName == 'Client Short-Code'
              ? MediaQuery.of(context).size.width * 0.2
              : MediaQuery.of(context).size.width *
                  0.09, // You can adjust this width as needed
          label: createColumnLabel(
            itemMasterTableName[itemMasterTableName.indexOf(columnName)],
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
    List<String> tabIcon = [
      'assets/item_master/Add New.png',
      'assets/item_master/Manufacturer.png',
      'assets/item_master/Brands.png',
      'assets/item_master/Brands.png',
      'assets/item_master/Delete.png',
    ];
    return CommonScaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: itemMasterTabName.length,
                    scrollDirection: Axis.horizontal,
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () {
                              controller.currentIndex.value = index;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => tabClass[index],
                                  ));
                            },
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              decoration: BoxDecoration(
                                  color: controller.currentIndex.value == index
                                      ? appColor
                                      : greyColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: [
                                  LocalAssetImage(
                                    path: tabIcon[index],
                                    height: 25,
                                    width: 25,
                                  ),
                                  horizontalSpace(10),
                                  CTextWhite(itemMasterTabName[index],
                                      mSize: 14)
                                ],
                              ),
                            ),
                          ));
                    },
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            textAlign: TextAlign.start,
                            "Name",
                            style: smallTextStyle),
                        SizedBox(
                            width: 200,
                            height: 30,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              readOnly: false,
                              style: const TextStyle(fontSize: 15),
                              controller: nameController,
                              onChanged: (value) => {},
                              textAlignVertical: TextAlignVertical.center,
                            )),
                      ],
                    ),
                    // horizontalSpace(20),
                    // CustomField(
                    //     width: 200,
                    //     height: 30,
                    //     controller: nameController,
                    //     name: 'Amount From',
                    //     validator: (p0) {},
                    //     style: normalTextStyle),
                    // horizontalSpace(20),
                    // CustomField(
                    //     width: 200,
                    //     height: 30,
                    //     controller: nameController,
                    //     name: toTxt,
                    //     validator: (p0) {},
                    //     style: normalTextStyle),
                  ],
                ),
                verticalSpace(20),
                Row(
                  children: [
                    CustomButton(
                        text: 'Search',
                        onPressed: () {
                          controller.filter(nameController.text);
                        }),
                    horizontalSpace(10),
                    CustomButton(text: 'Clear Search', onPressed: () {}),
                  ],
                ),
                verticalSpace(20),
                _buildDataGrid(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataGrid(BuildContext context) {
    if (itemMasterController.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    } else {
      itemMasterDataSource = ItemMasterDataSource(
          itemMasterController.itemMasterModel, context, 'userId');
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SfDataGridTheme(
            data: SfDataGridThemeData(
                gridLineStrokeWidth: 2, gridLineColor: greyColor),
            child: SfDataGrid(
                showCheckboxColumn: true,
                checkboxShape: const CircleBorder(),
                allowFiltering: false,
                allowSorting: true,
                selectionMode: SelectionMode.multiple,
                gridLinesVisibility: GridLinesVisibility.both,
                controller: DataGridController(),
                headerGridLinesVisibility: GridLinesVisibility.both,
                source: itemMasterDataSource,
                columns: buildColumns(context))),
      );
    }
  }
}
