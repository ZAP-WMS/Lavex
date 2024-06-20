class BomAddItemModel {
  final String title;
  final String quantityType;
  final int quantity;
  dynamic action;

  BomAddItemModel({
    required this.title,
    required this.quantityType,
    required this.quantity,
    required this.action,
  });
}
