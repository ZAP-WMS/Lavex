import 'package:flutter/material.dart';
import 'package:lavex/common/custom_text.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import 'package:lavex/widgets/cutom_textformfield.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../utils/string.dart';
import '../../../utils/style.dart';

class StockPage extends StatelessWidget {
  StockPage({super.key});

  TextEditingController clientController = TextEditingController();

  List<GridColumn> buildColumns(BuildContext context) {
    List<GridColumn> columns = [];
    for (String columnName in stockTableName) {
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
            stockTableName[stockTableName.indexOf(columnName)],
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
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            height: 60,
            child: TextField(
              onChanged: (value) {
                // Filter data based on the entered value
              },
              decoration: const InputDecoration(
                  hintText: 'Search...', prefixIcon: Icon(Icons.search)),
            ),
          ),
          CTextBlack('Client', mBold: false, mSize: 16),
          horizontalSpace(10),
          CustomTextFormField(
            width: 250,
            height: 30,
            controller: clientController,
            name: '',
            style: normalTextStyle,
            validator: (p0) {},
          ),
          verticalSpace(10),
          CustomButton(width: 100, text: 'Search', onPressed: () {})
        ],
      ),
    ));
  }

  // Widget _buildDataGrid(BuildContext context) {
  //   if (storeController.isLoading.value) {
  //     return const Center(child: CircularProgressIndicator());
  //   } else {
  //     // storeDataSource =
  //     //     StoreDataSource(storeController.storeModel, context, 'userId');
  //     return SizedBox(
  //       height: MediaQuery.of(context).size.height,
  //       child: SfDataGridTheme(
  //           data: SfDataGridThemeData(
  //               gridLineStrokeWidth: 2, gridLineColor: greyColor),
  //           child: SfDataGrid(
  //               showCheckboxColumn: true,
  //               checkboxShape: const CircleBorder(),
  //               allowFiltering: false,
  //               allowSorting: true,
  //               selectionMode: SelectionMode.multiple,
  //               gridLinesVisibility: GridLinesVisibility.both,
  //               controller: DataGridController(),
  //               headerGridLinesVisibility: GridLinesVisibility.both,
  //               source: storeDataSource,
  //               columns: buildColumns(context))),
  //     );
  //   }
  // }
}
