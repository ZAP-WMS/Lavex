import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/model/supplier_payments.dart';
import 'package:lavex/datasource/supplier_payment_datasource.dart';
import 'package:lavex/view/controller/supplier_controler.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_spacebar.dart';

class MySupplierPayment extends GetView<SupplierController> {
  late DataGridController _dataGridController;
  List<SupplierPaymentsModel> supplierModel = [];
  List<GridColumn> columns = [];
  late SupplierPaymentDatasource _supplierPaymentDatasource;
  String _searchQuery = '';
  final SupplierController supplierController = Get.put(SupplierController());

  List<GridColumn> buildColumns(BuildContext context) {
    List<GridColumn> columns = [];
    for (String columnName in supplierPayments) {
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
              : MediaQuery.of(context).size.width * 0.09,
          label: createColumnLabel(
            supplierPayments[supplierPayments.indexOf(columnName)],
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

  // void _filterData(String query) {
  //   _searchQuery = query;
  //   // Update the data source with the filtered data
  //   _supplierPaymentDatasource.filterData(_searchQuery);
  //   _supplierPaymentDatasource.updateDatagridSource();
  //   _supplierPaymentDatasource.buildDataGridRows();
  // }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      verticalSpace(50),
                      CustomButton(text: 'Add New Supplier', onPressed: () {}),
                      horizontalSpace(10),
                      CustomButton(text: 'Delete', onPressed: () {}),
                      horizontalSpace(10),
                      CustomButton(text: 'Export Data', onPressed: () {}),
                      verticalSpace(10),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 250,
                        height: 60,
                        child: TextField(
                          onChanged: (value) {
                            // Filter data based on the entered value
                            // _filterData(value);
                            supplierController.searchTxt.text =
                                value.toString();
                            supplierController.fetchSupplierData();
                          },
                          decoration: const InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: Icon(Icons.search)),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Obx(() {
                if (supplierController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  _supplierPaymentDatasource = SupplierPaymentDatasource(
                      supplierController.supplierModel, context, 'userId');
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
                            source: _supplierPaymentDatasource,
                            columns: buildColumns(context))),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Widget createColumnLabel(String labelText) {
  //   return Container(
  //     alignment: Alignment.center,
  //     child: Text(labelText,
  //         overflow: TextOverflow.values.first,
  //         textAlign: TextAlign.center,
  //         style: tableheader),
  //   );
  // }
}
