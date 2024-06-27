import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CartItem {
  String item;
  String brand;
  int quantity;
  double gst;
  double price;
  double total;

  CartItem(
      {required this.item,
      required this.brand,
      required this.quantity,
      required this.gst,
      required this.price,
      required this.total});

  factory CartItem.fromjson(Map<String, dynamic> json) {
    return CartItem(
        item: json['Item'],
        brand: json['Brand'],
        quantity: json['Quantity'],
        gst: json['Gst'],
        price: json['Price'],
        total: json['Total']);
  }

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'Item', value: item),
      DataGridCell(columnName: 'Brand', value: brand),
      DataGridCell(columnName: 'Quantity', value: quantity),
      DataGridCell(columnName: 'Gst', value: gst),
      DataGridCell(columnName: 'Price', value: price),
      DataGridCell(columnName: 'Total', value: total),
      // const DataGridCell(columnName: 'Add', value: null),
      const DataGridCell(columnName: 'Delete', value: null)
    ]);
  }
}
