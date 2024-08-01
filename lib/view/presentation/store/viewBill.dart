import 'package:flutter/material.dart';

class Product {
  final String name;
  final String brand;
  final int qty;
  final int gst;
  final double price;
  final String id;

  Product(
      {required this.name,
      required this.brand,
      required this.qty,
      required this.gst,
      required this.price,
      required this.id});
}

class ProductBillScreen extends StatelessWidget {
  final List<Product> previousProducts = [
    Product(
        name: 'prev foil',
        brand: 'prev brand',
        qty: 5,
        gst: 18,
        price: 50.0,
        id: 'prev1'),
    Product(
        name: 'prev tissue',
        brand: 'prev company',
        qty: 3,
        gst: 10,
        price: 2.6,
        id: 'prev2'),
  ];

  final List<Product> currentProducts = [
    Product(
        name: 'foil5',
        brand: 'brand2',
        qty: 10,
        gst: 18,
        price: 100.0,
        id: '66a21f55d56e141ddec8ae03'),
    Product(
        name: 'tissue white setkfdkfjkldjfdklsf92555',
        brand: 'companybrand2',
        qty: 6,
        gst: 10,
        price: 5.2,
        id: '66a21f55d56e141ddec8ae04'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: [
        buildProductionCard('Previous Production', previousProducts),
        buildProductionCard('Current Production', currentProducts),
      ],
    );
  }

  Widget buildProductionCard(String title, List<Product> products) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(thickness: 2),
            ...products.map((product) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product: ${product.name}',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text('Brand: ${product.brand}'),
                  Text('Quantity: ${product.qty}'),
                  Text('GST: ${product.gst}%'),
                  Text('Price: \$${product.price.toStringAsFixed(2)}'),
                  Divider(thickness: 1),
                ],
              );
            }).toList(),
            Text(
              'Total Quantity: ${products.fold(0, (sum, item) => sum + item.qty)}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Total Price: \$${products.fold(0, (sum, item) => sum + item.price.toInt()).toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
