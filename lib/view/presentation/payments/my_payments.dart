import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/my_payments.dart';
import 'package:lavex/datasource/mypayment_datasource.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../utils/colors.dart';
import '../../../utils/style.dart';
import '../../controller/my_payment_controller.dart';

class MyPayments extends GetView<MyPaymentController> {
  late DataGridController _dataGridController;

  List<MyPaymentsModel> paymentModel = [];
  List<GridColumn> columns = [];
  late MyPaymentDatasource _myPaymentDatasource;
  late Future<List<MyPaymentsModel>> futurePayments;
  final MyPaymentController myPaymentController =
      Get.put(MyPaymentController());
  List<GridColumn> buildColumns(BuildContext context) {
    List<GridColumn> columns = [];

    for (String columnName in myPayment) {
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
            myPayment[myPayment.indexOf(columnName)],
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
    return CommonScaffold(
      body: Obx(() {
        if (myPaymentController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          _myPaymentDatasource = MyPaymentDatasource(
              myPaymentController.paymentModel, context, 'userId');

          return SfDataGridTheme(
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
                  source: _myPaymentDatasource,
                  columns: buildColumns(context)));
        }
      }),
    );
  }
}
