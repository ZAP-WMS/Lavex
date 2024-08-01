import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lavex/data/model/cart_item.dart';
import 'package:lavex/utils/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../utils/style.dart';

class CreateInvoiceDatasource extends DataGridSource {
  dynamic userId;
  BuildContext mainContext;

  CreateInvoiceDatasource(this._cartModel, this.mainContext, this.userId) {
    buildDataGridRows();
  }
  void buildDataGridRows() {
    dataGridRows = _cartModel
        .map<DataGridRow>((dataGridRow) => dataGridRow.dataGridRow())
        .toList();
  }

  List<CartItem> _cartModel = [];
  List<String> name = ['item', 'abdul'];
  List<String> brand = ['Softex', 'Lavex'];

  List<DataGridRow> dataGridRows = [];

  /// [DataGridCell] on [onSubmitCell] method.
  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();

  @override
  List<DataGridRow> get rows => dataGridRows;

  void removeRowAtIndex(int index) {
    _cartModel.removeAt(index);
    buildDataGridRows();
    notifyListeners();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int dataIndex = dataGridRows.indexOf(row);

    // if (dataIndex != null) {
    //   print(_cartModel[dataIndex].quantity);
    //   print(_cartModel[dataIndex].price);
    //   totalValue = _cartModel[dataIndex].quantity * _cartModel[dataIndex].price;
    //   print(totalValue);
    //   _cartModel[dataIndex].total = totalValue;
    // }
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return (dataGridCell.columnName == 'Delete')
          ? IconButton(
              onPressed: () async {
                removeRowAtIndex(dataIndex);
              },
              icon: Icon(Icons.delete, color: redColor, size: 15))
          : (dataGridCell.columnName == 'Item')
              ? DropdownButton<String>(
                  value: _cartModel.isNotEmpty ? dataGridCell.value : "",
                  hint: const Text('Select Value'),
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
                        DataGridCell<String>(columnName: 'Item', value: value);
                    _cartModel[dataRowIndex].item = value.toString();

                    notifyListeners();
                    // updateDatagridSource();
                  },
                  items: name.isNotEmpty
                      ? name.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList()
                      : [
                          const DropdownMenuItem<String>(
                            value: "",
                            child: Text(""),
                          )
                        ])
              : (dataGridCell.columnName == 'Brand')
                  ? DropdownButton<String>(
                      value: _cartModel.isNotEmpty ? dataGridCell.value : "",
                      hint: const Text('Select Value'),
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
                                    dataCell.columnName ==
                                    dataGridCell.columnName)
                                ?.value ??
                            '';
                        if (oldValue == value || value == null) {
                          return;
                        }

                        final int dataRowIndex = dataGridRows.indexOf(row);
                        dataGridRows[dataRowIndex].getCells()[1] =
                            DataGridCell<String>(
                                columnName: 'Brand', value: value);
                        _cartModel[dataRowIndex].item = value.toString();

                        notifyListeners();
                        // updateDatagridSource();
                      },
                      items: brand.isNotEmpty
                          ? brand.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList()
                          : [
                              const DropdownMenuItem<String>(
                                value: "",
                                child: Text(""),
                              )
                            ])
                  : Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(dataGridCell.value.toString(),
                          textAlign: TextAlign.center, style: tablefontsize));
    }).toList());
  }

  void updateDatagridSource() {
    notifyListeners();
  }

  void removeRowByInvoiceNo(String invoiceNo) {
    _cartModel.removeWhere((payment) => payment.brand == invoiceNo);
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
    if (column.columnName == 'Item') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'Item', value: newCellValue);
      _cartModel[dataRowIndex].item = newCellValue;
    } else if (column.columnName == 'Brand') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'Brand', value: newCellValue);
      _cartModel[dataRowIndex].brand = newCellValue;
    } else if (column.columnName == 'Quantity') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'Quantity', value: newCellValue);
      _cartModel[dataRowIndex].quantity = newCellValue;
    } else if (column.columnName == 'Gst') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<double>(columnName: 'Gst', value: newCellValue);
      _cartModel[dataRowIndex].gst = newCellValue;
    } else if (column.columnName == 'Price') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'Price', value: newCellValue);
      _cartModel[dataRowIndex].price = newCellValue;
    } else if (column.columnName == 'Total') {
      double totalValue =
          _cartModel[dataRowIndex].quantity * _cartModel[dataRowIndex].price;
      _cartModel[dataRowIndex].total = totalValue;

      // Create a new DataGridCell with updated total value and replace it in dataGridRows
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<double>(columnName: 'Total', value: totalValue);
      // dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
      //     DataGridCell<double>(columnName: 'Total', value: newCellValue);
      _cartModel[dataRowIndex].gst = double.parse(newCellValue);
    } else if (column.columnName == 'Delete') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<dynamic>(columnName: 'Delete', value: newCellValue);
      _cartModel[dataRowIndex].total = newCellValue;
    }

    if (column.columnName == 'Quantity' || column.columnName == 'Price') {
      double totalValue =
          _cartModel[dataRowIndex].quantity * _cartModel[dataRowIndex].price;
      _cartModel[dataRowIndex].total = totalValue;

      // Update the Total cell in dataGridRows
      int totalCellIndex = dataGridRows[dataRowIndex]
          .getCells()
          .indexWhere((cell) => cell.columnName == 'Total');

      if (totalCellIndex != -1) {
        dataGridRows[dataRowIndex].getCells()[totalCellIndex] =
            DataGridCell<double>(columnName: 'Total', value: totalValue);
      }
    }

    notifyListeners();
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

    final bool isNumericType = column.columnName == 'Quantity' ||
        column.columnName == 'Gst' ||
        column.columnName == 'Price';

    final bool isDateTimeType = column.columnName == 'StartDate';
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
        decoration: const InputDecoration(contentPadding: EdgeInsets.all(5.0)),
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
            }
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
