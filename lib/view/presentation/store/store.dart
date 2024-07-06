import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/datasource/store_datasource.dart';
import 'package:lavex/routes/route_pages.dart';
import 'package:lavex/view/controller/store_controller.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../common/custom_text.dart';
import '../../../utils/asset_image.dart';
import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_spacebar.dart';

class StorePage extends GetView<StoreController> {
  StorePage({super.key});

  final ScrollController scrollController = ScrollController();
  late StoreDataSource storeDataSource;
  final StoreController storeController = Get.put(StoreController());

  List<GridColumn> buildColumns(BuildContext context) {
    List<GridColumn> columns = [];
    for (String columnName in storeTabName) {
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
            storeTabName[storeTabName.indexOf(columnName)],
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
      'assets/store/Cash Inward Entry.png',
      'assets/store/inward Entry.png',
      'assets/store/Add new production.png',
      'assets/store/Stocks.png',
      'assets/store/Cancelled stocks list.png',
      'assets/store/Stock Received.png',
      'assets/store/Stock Pending.png',
      'assets/store/Cancel.png',
      'assets/store/All inward entry.png',
      'assets/store/All Production Entry.png',
      'assets/store/All Movement Entry.png',
      'assets/store/All cash inward Entry.png',
      'assets/store/All DC Entry.png',
      'assets/store/Store settings.png',
    ];

    List<String> pages = [
      AppRoutes.cashInwardHome,
      AppRoutes.cashInwardHome,
      AppRoutes.cashInwardHome,
      AppRoutes.stockPage
    ];
    return CommonScaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 2.0,
                  runSpacing: 0.0,
                  children: List.generate(storeTabName.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.currentIndex.value = index;
                          Get.toNamed(pages[index]);
                        },
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                              color: controller.currentIndex.value == index
                                  ? appColor
                                  : whiteColor,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: greyColor)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LocalAssetImage(
                                  path: tabIcon[index], height: 25, width: 25),
                              horizontalSpace(5),
                              controller.currentIndex.value == index
                                  ? CTextWhite(storeTabName[index], mSize: 14)
                                  : CTextBlack(storeTabName[index], mSize: 14)
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Divider(color: greyColor),
                _buildDataGrid(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataGrid(BuildContext context) {
    if (storeController.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    } else {
      storeDataSource =
          StoreDataSource(storeController.storeModel, context, 'userId');
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
                source: storeDataSource,
                columns: buildColumns(context))),
      );
    }
  }
}
