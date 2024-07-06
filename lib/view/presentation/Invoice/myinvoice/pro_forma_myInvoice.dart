import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/utils/colors.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/view/controller/invoice_controller.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../data/model/cart_item.dart';
import '../../../../data/model/my_invoice_model.dart';
import '../../../../datasource/myInvoice_datasource.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../../utils/style.dart';

class MyProFormaInvoice extends GetView<InvoiceController> {
  String? pageTitle;
  final List<CartItem>? cartItems;
  MyProFormaInvoice({super.key, this.cartItems, this.pageTitle});

  final TextEditingController clientController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController invoiceController = TextEditingController();
  final TextEditingController shortCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController increaseInvoiceController =
      TextEditingController();
  final TextEditingController toShippedController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController invoiceDateController = TextEditingController();
  final TextEditingController forToShippedController = TextEditingController();
  final TextEditingController stateCodeController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController selectedCurrencyController =
      TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController poNoController = TextEditingController();
  final TextEditingController maturityDateController = TextEditingController();
  final TextEditingController delieveryChallanController =
      TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();
  final TextEditingController paymentMethodController = TextEditingController();

  // table controller
  final TextEditingController itemController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  //Datasource FIle
  late MyInvoiceDatasource _invoiceDatasource;
  late DataGridController _dataGridController;
  List<MyInvoiceModel> invoiceModel = [];

  final ScrollController scrollController = ScrollController();

  List<GridColumn> columns = [];
  List<List<String>> tabColumnNames = [myInvoiceTableName];

  List<List<String>> tabColumnLabels = [
    myInvoiceTableName,

    // Labels for tab 1
    // Labels for tab 2
  ];

 
  @override
  Widget build(BuildContext context) {
    final InvoiceController controller = Get.put(InvoiceController());
    invoiceModel.add(MyInvoiceModel(
        number: '1',
        date: 'date',
        clientName: 'clientName',
        type: 'type',
        status: 'status',
        gst: 'gst',
        total: 122.5,
        options: 'options'));
    invoiceModel.add(MyInvoiceModel(
        number: '2',
        date: 'fdf',
        clientName: 'clienffftName',
        type: 'fff',
        status: 'ggggf',
        gst: 'sss',
        total: 122.5,
        options: 'eere'));
    _invoiceDatasource = MyInvoiceDatasource(invoiceModel, context, 'userId');
    _dataGridController = DataGridController();

    List<String> currentColumnNames = tabColumnNames[0];
    List<String> currentColumnLabels = tabColumnLabels[0];
    columns.clear();
    for (String columnName in currentColumnNames) {
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
            currentColumnLabels[currentColumnNames.indexOf(columnName)],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: greyColor)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10),
                SfDataGridTheme(
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
                        source: _invoiceDatasource,
                        columns: columns))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _deleteSelectedRows() {
    final selectedRows = _dataGridController.selectedRows;
    for (var row in selectedRows) {
      final num = row
          .getCells()
          .firstWhere((cell) => cell.columnName == 'number')
          .value;
      invoiceModel.removeWhere((employee) => employee.number == num);
    }
    _dataGridController.selectedRows.clear();
    _invoiceDatasource.updateDatagridSource();
  }
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
