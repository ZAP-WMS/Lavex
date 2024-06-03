import 'package:flutter/material.dart';
import 'package:lavex/data/model/my_payments.dart';
import 'package:lavex/datasource/cashMemo_payments.dart';
import 'package:lavex/utils/string.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../utils/colors.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_scaffold.dart';

class CashMemoPayments extends StatelessWidget {
  CashMemoPayments({super.key});

  late DataGridController _dataGridController;
  List<MyPaymentsModel> paymentModel = [];
  List<GridColumn> columns = [];
  late CashMemoDatasource _cashMemoDatasource;

  @override
  Widget build(BuildContext context) {
    paymentModel.add(MyPaymentsModel(
      invPaymentNumber: 'paymentNo',
      invNumber: '12556',
      dateCreate: 'date',
      clientName: 'pratyush',
      invAmount: '155.30',
      paymentAmount: 'rre',
      paymentMethod: 'paymentMethod',
      paymentCheque: 'paymentCheque',
      paymentChqDate: 'chequeDate',
    ));

    _cashMemoDatasource = CashMemoDatasource(paymentModel, context, 'userId');
    _dataGridController = DataGridController();
    columns.clear();
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
    return CommonScaffold(
      body: SfDataGridTheme(
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
              source: _cashMemoDatasource,
              columns: columns)),
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
