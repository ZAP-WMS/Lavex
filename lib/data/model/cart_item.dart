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
        item: json['item'],
        brand: json['brand'],
        quantity: json['quantity'],
        gst: json['gst'],
        price: json['price'],
        total: json['total']);
  }

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'item', value: item),
      DataGridCell(columnName: 'brand', value: brand),
      DataGridCell(columnName: 'quantity', value: quantity),
      DataGridCell(columnName: 'gst', value: gst),
      DataGridCell(columnName: 'price', value: price),
      DataGridCell(columnName: 'total', value: total),
      // const DataGridCell(columnName: 'Add', value: null),
      const DataGridCell(columnName: 'Delete', value: null)
    ]);
  }
}
