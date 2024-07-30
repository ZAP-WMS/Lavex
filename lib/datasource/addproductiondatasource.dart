import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lavex/common/custom_text.dart';
import 'package:lavex/data/model/bom_add_item.dart';
import 'package:lavex/data/model/getallinwardentrymodel.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../data/model/getitemmodel.dart';
import '../utils/style.dart';
import '../widgets/drop_downTextField.dart';

class Addproductiondatasource extends DataGridSource {
  String userId;
  BuildContext mainContext;
  List<ItemMasterData> Itemraw = [];
  List<ItemMasterData> Itemredy = [];
  List data = [];
  List<String> name = [];
  Addproductiondatasource(this._bomModel, this.mainContext, this.userId,
      this.Itemraw, this.Itemredy) {
    buildDataGridRows();
  }
  void buildDataGridRows() {
    dataGridRows = _bomModel
        .map<DataGridRow>((dataGridRow) => dataGridRow.dataGridRow())
        .toList();
    name.assignAll(Itemraw.map((f) => f.name as String).toList());
  }

  @override
  List<BomAddItemModel> _bomModel = [];
  List<DataGridRow> dataGridRows = [];

  /// [DataGridCell] on [onSubmitCell] method.
  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    DateTime? rangeEndDate = DateTime.now();
    DateTime? date;
    DateTime? endDate;
    DateTime? rangeStartDate1 = DateTime.now();
    DateTime? rangeEndDate1 = DateTime.now();
    DateTime? date1;
    DateTime? endDate1;
    final int dataRowIndex = dataGridRows.indexOf(row);
    int last = dataGridRows.length - 1;
    String Pagetitle = 'Daily Report';

    int lastRowIndex = dataGridRows.length - 1;

    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        void removeRowAtIndex(int index) {
          _bomModel.removeAt(index);
          buildDataGridRows();
          notifyListeners();
        }

        void addRowAtIndex(int index, BomAddItemModel rowData) {
          _bomModel.insert(index, rowData);
          buildDataGridRows();
          notifyListeners();
        }

        return Container(
          alignment: Alignment.center,
          child: (dataGridCell.columnName == 'Name')
              ? DropdownButton<String>(
                  value: name.isNotEmpty ? dataGridCell.value : "",
                  hint: Text('Select Value'),
                  autofocus: true,
                  focusColor: Colors.transparent,
                  underline: const Text(''),
                  itemHeight: 50,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  isExpanded: true,

                  //8   style: textStyle,
                  onChanged: (String? value) {
                    // selectedValue = value;
                    final dynamic oldValue = row
                            .getCells()
                            .firstWhereOrNull((DataGridCell dataCell) =>
                                dataCell.columnName == dataGridCell.columnName)
                            ?.value ??
                        '';
                    if (oldValue == value || value == null) {
                      return;
                    }

                    final int dataRowIndex = dataGridRows.indexOf(row);
                    dataGridRows[dataRowIndex].getCells()[0] =
                        DataGridCell<String>(columnName: 'Name', value: value);
                    _bomModel[dataRowIndex].title = value.toString();
                    ItemMasterData element =
                        Itemraw.firstWhere((element) => element.name == value);
                    dataGridRows[dataRowIndex].getCells()[1] =
                        DataGridCell<String>(
                            columnName: 'Quantity Type',
                            value: element.qtyType);
                    dataGridRows[dataRowIndex].getCells()[2] =
                        DataGridCell<String>(
                            columnName: 'Quantity',
                            value: element.qty.toString());
                    // _bomModel[dataRowIndex].quantityType =
                    //     element.qtyType.toString();

                    notifyListeners();
                    // updateDatagridSource();
                  },
                  items: name.isNotEmpty
                      ? name.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList()
                      : [
                          DropdownMenuItem<String>(
                            value: "",
                            child: Text(""),
                          )
                        ])
              : (dataGridCell.columnName == 'Manage')
                  ? userId != "detail"
                      ? ElevatedButton(
                          onPressed: () {
                            if (dataRowIndex == lastRowIndex) {
                              addRowAtIndex(
                                  dataRowIndex + 1,
                                  BomAddItemModel(
                                      title: name.isEmpty ? "" : name[0],
                                      quantityType: name.isEmpty
                                          ? 'quantityType'
                                          : Itemraw.firstWhere(
                                                  (e) => e.name == name[0])
                                              .qtyType
                                              .toString(),
                                      quantity: Itemraw.firstWhere(
                                              (e) => e.name == name[0]).qty
                                          as int));
                            } else {
                              removeRowAtIndex(dataRowIndex);
                            }
                          },
                          child: CTextWhite(
                            dataRowIndex == lastRowIndex ? 'Add Row' : 'Remove',
                            mBold: true,
                            mSize: 14,
                          ))
                      : Container(
                          color: Colors.amber,
                        )
                  : Text(
                      dataGridCell.value.toString(),
                      textAlign: TextAlign.center,
                      style: tablefontsize,
                    ),
        );
      }).toList(),
    );
  }

  void updateDatagridSource() {
    notifyListeners();
  }

  void updateDataGrid({required RowColumnIndex rowColumnIndex}) {
    notifyDataSourceListeners(rowColumnIndex: rowColumnIndex);
  }

  @override
  void onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex,
      GridColumn column) {
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
    if (column.columnName == 'Name') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'Name', value: newCellValue);
      _bomModel[dataRowIndex].title = newCellValue;
    } else if (column.columnName == 'Quantity Type') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(
              columnName: 'Quantity Type', value: newCellValue);
      _bomModel[dataRowIndex].quantityType = newCellValue;
    } else if (column.columnName == 'Quantity') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(
              columnName: 'Quantity', value: int.parse(newCellValue));
      _bomModel[dataRowIndex].quantity = int.parse(newCellValue);
    } else {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'Manage', value: newCellValue);
      _bomModel[dataRowIndex].manage = newCellValue;
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
    newCellValue = '';

    final bool isNumericType = column.columnName == 'Quantity';

    final bool isDateTimeType = column.columnName == 'StartDate' ||
        column.columnName == 'EndDate' ||
        column.columnName == 'ActualStart' ||
        column.columnName == 'ActualEnd';
    // Holds regular expression pattern based on the column type.
    final RegExp regExp =
        _getRegExp(isNumericType, isDateTimeType, column.columnName);

    return Container(
      alignment: isNumericType ? Alignment.centerRight : Alignment.centerLeft,
      child: TextField(
        style: const TextStyle(
          fontSize: 12,
        ),
        autofocus: true,
        controller: editingController..text = displayText,
        textAlign: isNumericType ? TextAlign.right : TextAlign.left,
        autocorrect: false,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(regExp),
        ],
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(
            5.0,
          ),
        ),
        keyboardType: isNumericType
            ? const TextInputType.numberWithOptions()
            : isDateTimeType
                ? TextInputType.datetime
                : TextInputType.text,
        onTapOutside: (event) {
          newCellValue = editingController.text;
        },
        onChanged: (String value) {
          if (value.isNotEmpty) {
            if (isNumericType) {
              newCellValue = int.parse(value);
              _bomModel[dataGridRows.indexOf(dataGridRow)].quantity =
                  int.parse(value);
            } else if (isDateTimeType) {
              newCellValue = value;
            } else {
              newCellValue = value;
            }
          }
        },
        onSubmitted: (String value) {
          newCellValue = value;

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
            : RegExp('[a-zA-Z0-9.@!#^&*(){+-}%|<>?_=+,/ )]');
  }
}
