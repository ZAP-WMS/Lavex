import 'package:flutter/material.dart';
import 'package:lavex/data/model/bom.dart';
import 'package:lavex/datasource/bom_datasource.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../utils/colors.dart';
import '../../utils/string.dart';
import 'Invoice/myinvoice/myInvoice..dart';

class BomPage extends StatelessWidget {
  BomPage({super.key});

  late DataGridController _dataGridController;
  List<BomModel> bomModel = [];
  List<GridColumn> columns = [];
  late BomDataSource _bomDataSource;
  @override
  Widget build(BuildContext context) {
    bomModel.add(BomModel(
        name: 'pratyush', store: 'Maruti', status: 'Pending', manage: 'dfd'));

    _bomDataSource = BomDataSource(bomModel, context, 'userId');
    _dataGridController = DataGridController();
    columns.clear();
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
    return CommonScaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomButton(text: 'Add New', onPressed: () {}),
                  horizontalSpace(5),
                  CustomButton(text: 'Delete', onPressed: () {}),
                  horizontalSpace(5),
                  CustomButton(text: 'Export Data', onPressed: () {})
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 300,
                height: 60,
                child: TextField(
                  onChanged: (value) {
                    // Filter data based on the entered value
                  },
                  decoration: const InputDecoration(
                      hintText: 'Search...', prefixIcon: Icon(Icons.search)),
                ),
              )
            ],
          ),
        ),
        verticalSpace(10),
        Padding(
          padding: const EdgeInsets.all(10.0),
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
                  columns: columns)),
        ),
      ],
    ));
  }
}
