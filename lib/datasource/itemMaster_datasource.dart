import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lavex/data/model/item_master.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../data/model/getitemmodel.dart';
import '../utils/colors.dart';
import '../utils/style.dart';
import '../view/presentation/ItemMaster/update_item_master.dart';
import '../widgets/custom_spacebar.dart';

class ItemMasterDataSource extends DataGridSource {
  dynamic userId;
  BuildContext mainContext;

  List data = [];
  ItemMasterDataSource(this._itemMasterModel, this.mainContext, this.userId) {
    buildDataGridRows();
  }
  void buildDataGridRows() {
    dataGridRows = _itemMasterModel
        .map<DataGridRow>((dataGridRow) => dataGridRow.dataGridRow())
        .toList();
  }

  List<ItemMasterData> _itemMasterModel = [];

  List<DataGridRow> dataGridRows = [];

  /// [DataGridCell] on [onSubmitCell] method.
  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();

  @override
  List<DataGridRow> get rows => dataGridRows;

  void removeRowAtIndex(int index) {
    _itemMasterModel.removeAt(index);
    buildDataGridRows();
    notifyListeners();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      final int dataRowIndex = dataGridRows.indexOf(row);
      return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: (dataGridCell.columnName == 'Manage')
              ? Container(
                  height: 500,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: redColor),
                          onPressed: () {
                            print(_itemMasterModel[dataRowIndex].name);
                            Get.to(UpdateItemMaster(
                              itemMasterModel: _itemMasterModel[dataRowIndex],
                            ));
                            // Get.toNamed('/edit-page');
                          },
                        ),
                        horizontalSpace(5),
                        PopupMenuButton<String>(
                          icon: Icon(Icons.menu, color: redColor),
                          onSelected: (String result) {
                            switch (result) {
                              case 'Delete':
                                // Handle Option 1
                                break;
                              case 'Option 2':
                                // Handle Option 2
                                break;
                              case 'Option 3':
                                // Handle Option 3
                                break;
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'Option 1',
                              child: Text('Option 1'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'Option 2',
                              child: Text('Option 2'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'Option 3',
                              child: Text('Option 3'),
                            ),
                          ],
                        )
                      ]),
                )
              : Text(
                  dataGridCell.value.toString(),
                  textAlign: TextAlign.center,
                  style: tablefontsize,
                ));
    }).toList());
  }

  void updateDatagridSource() {
    notifyListeners();
  }

  void removeRowByInvoiceNo(String invoiceNo) {
    _itemMasterModel.removeWhere((payment) => payment.itemCode == invoiceNo);
    buildDataGridRows();
    notifyListeners();
  }

  void updateDataGrid({required RowColumnIndex rowColumnIndex}) {
    notifyDataSourceListeners(rowColumnIndex: rowColumnIndex);
  }

  @override
  Future<void> onCellSubmit(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column) async {
    final dynamic oldValue = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value ??
        '';

    final int dataRowIndex = dataGridRows.indexOf(dataGridRow);

    if (newCellValue == null || oldValue == newCellValue) {
      return;
    }
    if (column.columnName == 'id') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<double>(columnName: 'id', value: newCellValue);
      _itemMasterModel[dataRowIndex].sId = newCellValue;
    } else if (column.columnName == 'name') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'name', value: newCellValue);
      _itemMasterModel[dataRowIndex].name = newCellValue;
    } else if (column.columnName == 'item_code') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'item_code', value: newCellValue);
      _itemMasterModel[dataRowIndex].itemCode = newCellValue;
    } else if (column.columnName == 'quantity') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'quantity', value: newCellValue);
      _itemMasterModel[dataRowIndex].qty = newCellValue;
    } else if (column.columnName == 'low_quantity') {
      // dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
      //     DataGridCell<String>(columnName: 'low_quantity', value: newCellValue);
      // _itemMasterModel[dataRowIndex].lowQuantity = newCellValue;
    } else if (column.columnName == 'quantity_type') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(
              columnName: 'quantity_type', value: newCellValue);
      _itemMasterModel[dataRowIndex].qtyType = newCellValue;
    } else if (column.columnName == 'single_price') {
      // dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
      //     DataGridCell<String>(columnName: 'single_price', value: newCellValue);
      // _itemMasterModel[dataRowIndex].singlePrice = newCellValue;
    } else if (column.columnName == 'gst_rate') {
      // dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
      //     DataGridCell<String>(columnName: 'gst_rate', value: newCellValue);
      // _itemMasterModel[dataRowIndex].gstRate = newCellValue;
    } else if (column.columnName == 'stock_status') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'stock_status', value: newCellValue);
      _itemMasterModel[dataRowIndex].stockStatus = newCellValue;
    } else if (column.columnName == 'store_name') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'store_name', value: newCellValue);
      _itemMasterModel[dataRowIndex].store = newCellValue;
    } else if (column.columnName == 'category') {
      // dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
      //     DataGridCell<String>(columnName: 'category', value: newCellValue);
      // _itemMasterModel[dataRowIndex].category = newCellValue;
    } else if (column.columnName == 'total') {
      // dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
      //     DataGridCell<String>(columnName: 'total', value: newCellValue);
      // _itemMasterModel[dataRowIndex].total = newCellValue;
    } else {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'Manage', value: newCellValue);
      _itemMasterModel[dataRowIndex].manage = newCellValue;
    }
  }

  @override
  bool canSubmitCell(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex,
      GridColumn column) {
    // Return false, to retain in edit mode.
    return true; // or super.canSubmitCell(dataGridRow, rowColumnIndex, column);
  }

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    // Text going to display on editable widget
    final String displayText = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value
            ?.toString() ??
        '';

    // The new cell value must be reset.
    // To avoid committing the [DataGridCell] value that was previously edited
    // into the current non-modified [DataGridCell].
    newCellValue = null;

    final bool isNumericType = column.columnName == 'SiNo';
    //  ||
    // column.columnName == 'StartDate' ||
    // column.columnName == 'EndDate' ||
    // column.columnName == 'ActualStart' ||
    // column.columnName == 'ActualEnd' ||
    // column.columnName == 'ActualDuration' ||
    // column.columnName == 'Delay' ||
    // column.columnName == 'Unit' ||
    // column.columnName == 'QtyScope' ||
    // column.columnName == 'QtyExecuted' ||
    // column.columnName == 'BalancedQty' ||
    // column.columnName == 'Progress' ||
    // column.columnName == 'Weightage';

    final bool isDateTimeType = column.columnName == 'StartDate' ||
        column.columnName == 'EndDate' ||
        column.columnName == 'ActualStart' ||
        column.columnName == 'ActualEnd';
    // Holds regular expression pattern based on the column type.
    final RegExp regExp =
        _getRegExp(isNumericType, isDateTimeType, column.columnName);

    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: isNumericType ? Alignment.centerRight : Alignment.centerLeft,
      child: TextField(
        style: tablefontsize,
        autofocus: true,
        controller: editingController..text = displayText,
        textAlign: isNumericType ? TextAlign.right : TextAlign.left,
        autocorrect: false,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(
            5.0,
          ),
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(regExp),
        ],
        keyboardType: isNumericType
            ? TextInputType.number
            : isDateTimeType
                ? TextInputType.datetime
                : TextInputType.text,
        onChanged: (String value) {
          if (value.isNotEmpty) {
            if (isNumericType) {
              newCellValue = int.parse(value);
            } else if (isDateTimeType) {
              newCellValue = value;
            } else {
              newCellValue = value;
            }
          } else {
            newCellValue = null;
          }
        },
        onSubmitted: (String value) {
          /// Call [CellSubmit] callback to fire the canSubmitCell and
          /// onCellSubmit to commit the new value in single place.
          submitCell();
        },
      ),
    );
  }

  RegExp _getRegExp(
      bool isNumericKeyBoard, bool isDateTimeBoard, String columnName) {
    return isNumericKeyBoard
        ? RegExp('[0-9]')
        : isDateTimeBoard
            ? RegExp('[0-9/]')
            : RegExp('[a-zA-Z0-9 ]');
  }
}
