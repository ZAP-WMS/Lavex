class CartItem {
  final String item;
  final String brand;
  final int quantity;
  final double gst;
  final double price;
  final double total;

  CartItem(
      {required this.item,
      required this.brand,
      required this.quantity,
      required this.gst,
      required this.price,
      required this.total});
}
