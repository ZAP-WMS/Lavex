import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/datasource/store_datasource.dart';
import 'package:lavex/routes/route_pages.dart';
import 'package:lavex/view/controller/store_controller.dart';
import 'package:lavex/view/presentation/store/viewBill.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../common/custom_text.dart';
import '../../../datasource/Inwardentrysource.dart';
import '../../../datasource/all_productionentrysource.dart';
import '../../../datasource/allstocksource.dart';
import '../../../datasource/production_store_source.dart';
import '../../../datasource/purchaseStoresource.dart';
import '../../../utils/asset_image.dart';
import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_spacebar.dart';

class StorePage extends GetView<StoreController> {
  StorePage({super.key});
  List<DataGridRow> SelectedproductionentryRows = [];
  final ScrollController scrollController = ScrollController();
  late Inwardentrysource storeDataSource;
  late purchaseStoresource purchaseStoreSource;
  late ProductionStoresource productionStoresource;
  late Allproductionentrysource producentrySource;
  late AllStocksource allStocksource;
  List<String> cid = [];
  List<GridColumn> buildColumns(BuildContext context) {
    List<GridColumn> columns = [];
    String labelText = '';
    List<String> TabName = [];

    if (controller.currentIndex.value == 14) {
      TabName = purchaseStoreTabName;
    } else if (controller.currentIndex.value == 9) {
      TabName = productionentryTabName;
    } else if (controller.currentIndex.value == 15) {
      TabName = productionstoreTabName;
    } else if (controller.currentIndex.value == 3) {
      TabName = allStockTabName;
    } else {
      TabName = InwardTabName;
    }

    for (String columnName in TabName) {
      if (controller.currentIndex.value == 14) {
        labelText =
            purchaseStoreTabName[purchaseStoreTabName.indexOf(columnName)];
      } else if (controller.currentIndex.value == 9) {
        labelText =
            productionentryTabName[productionentryTabName.indexOf(columnName)];
      } else if (controller.currentIndex.value == 15) {
        labelText =
            productionstoreTabName[productionstoreTabName.indexOf(columnName)];
      } else if (controller.currentIndex.value == 3) {
        labelText = allStockTabName[allStockTabName.indexOf(columnName)];
      } else {
        labelText = InwardTabName[InwardTabName.indexOf(columnName)];
      }
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
          label: createColumnLabel(labelText),
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
      'assets/store/All DC Entry.png',
      'assets/store/Store settings.png',
    ];

    List<String> pages = [
      AppRoutes.cashInwardHome,
      AppRoutes.cashInwardHome,
      AppRoutes.addproduction,
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
                          ontabselect(index, pages);
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

  void ontabselect(int index, List<String> pages) {
    if (index < 3) {
      controller.currentIndex.value = index;
      Get.toNamed(pages[index]);
    } else {
      if (index == 11) {
        controller.currentIndex.value = index;
        controller.getinwardData("Cash");
        print(storeTabName[index]);
      } else if (index == 4) {
        controller.currentIndex.value = index;
        // Get.toNamed(AppRoutes.viewBilldetail);
      } else if (index == 8) {
        controller.currentIndex.value = index;
        controller.getinwardData("");
        print(storeTabName[index]);
      } else if (index == 5) {
        controller.isLoading(true);
        controller.updateStatus(
            SelectedproductionentryRows.map((e) => e.getCells()[5].value)
                .toList(),
            "confirmed");
        // controller.isLoading(false);
        print(SelectedproductionentryRows.map((e) => e.getCells()[5].value)
            .toList());
      } else if (index == 6) {
        controller.isLoading(true);
        controller.updateStatus(
            SelectedproductionentryRows.map((e) => e.getCells()[5].value)
                .toList(),
            "pending");
        // controller.isLoading(false);
        print(SelectedproductionentryRows.map((e) => e.getCells()[5].value)
            .toList());
      } else if (index == 7) {
        controller.isLoading(true);
        controller.updateStatus(
            SelectedproductionentryRows.map((e) => e.getCells()[5].value)
                .toList(),
            "canceled");
        // controller.isLoading(false);
        print(SelectedproductionentryRows.map((e) => e.getCells()[5].value)
            .toList());
      } else {
        controller.currentIndex.value = index;
      }
    }
  }

  Widget _buildDataGrid(BuildContext context) {
    if (controller.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    } else {
      getAllSource(context);
      // print(storeController.purchaseStore);
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
                onSelectionChanged: (addedRows, removedRows) {
                  if (controller.currentIndex.value == 9) {
                    SelectedproductionentryRows.addAll(addedRows);
                    if (removedRows.isNotEmpty) {
                      removedRows.forEach(
                          (e) => SelectedproductionentryRows.remove(e));
                    }
                    print(SelectedproductionentryRows.length);
                  }
                },
                controller: DataGridController(),
                headerGridLinesVisibility: GridLinesVisibility.both,
                source: GetSource(),
                columns: buildColumns(context))),
      );
    }
  }

  void getAllSource(BuildContext context) {
    storeDataSource =
        Inwardentrysource(controller.inwardEntry, context, 'userId');
    purchaseStoreSource =
        purchaseStoresource(controller.purchaseStore, context, 'userId');
    producentrySource =
        Allproductionentrysource(controller.listproentry, context, "userId");
    productionStoresource = ProductionStoresource(
        controller.listproductionstore, context, "userId");
    allStocksource = AllStocksource(controller.liststock, context, "userId");
  }

  DataGridSource GetSource() {
    if (controller.currentIndex.value == 14) {
      return purchaseStoreSource;
    } else if (controller.currentIndex.value == 9) {
      return producentrySource;
    } else if (controller.currentIndex.value == 15) {
      return productionStoresource;
    } else if (controller.currentIndex.value == 3) {
      return allStocksource;
    } else {
      return storeDataSource;
    }
  }
}
