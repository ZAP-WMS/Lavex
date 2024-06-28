import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/model/my_clients.dart';
import 'package:lavex/datasource/my_clients_datasource.dart';
import 'package:lavex/view/controller/my_payment_controller.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../../../utils/style.dart';
import '../../controller/my_client_controller.dart';

class MyClient extends GetView<MyClientController> {
  late DataGridController _dataGridController;

  List<MyClientModel> clientModel = [];

  List<GridColumn> columns = [];

  late MyClientDataSource myClientDataSource;
  final MyClientController myClientController = Get.put(MyClientController());

  List<GridColumn> buildColumns(BuildContext context) {
    List<GridColumn> columns = [];
    for (String columnName in myClientTableName) {
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
            myClientTableName[myClientTableName.indexOf(columnName)],
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    verticalSpace(50),
                    CustomButton(text: 'My Client', onPressed: () {}),
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
                          myClientController.searchTxt.text = value;
                          myClientController.myClientData();
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
              if (myClientController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                myClientDataSource = MyClientDataSource(
                    myClientController.myClientModel, context, 'userId');

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
                          source: myClientDataSource,
                          columns: buildColumns(context))),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
