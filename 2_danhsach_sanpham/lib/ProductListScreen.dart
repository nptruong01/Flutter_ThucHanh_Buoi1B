// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'detail.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Laptop Acer Aspire 7 Gaming A715 76G 5132 ',
      imageUrl:
          'https://cdn.tgdd.vn/Products/Images/44/307786/acer-aspire-7-gaming-a715-76g-5132-i5-nhqmesv002-thumb-600x600.jpg',
      description: 'i5 12450H/8GB/512GB/4GB GTX1650/144Hz/Win11',
      price: 13990000,
    ),
    Product(
      name: 'Laptop MSI Gaming GF63 Thin 11SC',
      imageUrl:
          'https://cdn.tgdd.vn/Products/Images/44/303500/msi-gaming-gf63-thin-11sc-i5-664vn-glr-thumb-600x600.jpg',
      description: 'i5 11400H/8GB/512GB/4GB GTX1650/144Hz/Win11 ',
      price: 13990000,
    ),
    Product(
      name: 'Laptop Lenovo Ideapad Gaming 3 15IAH7',
      imageUrl:
          'https://cdn.tgdd.vn/Products/Images/44/283775/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-thumb-600x600.jpg',
      description: 'i5 12500H/8GB/512GB/4GB RTX3050/120Hz/Win11',
      price: 13990000,
    ),
    Product(
      name: 'Laptop Acer Aspire 7 Gaming A715 43G R8GA',
      imageUrl:
          'https://cdn.tgdd.vn/Products/Images/44/285961/acer-aspire-7-gaming-a715-43g-r8ga-r5-nhqhdsv002-thumb-600x600.jpg',
      description: 'R5 5625U/8GB/512GB/4GB RTX3050/144Hz/Win11',
      price: 13990000,
    ),
  ];

  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'TheGioiDiDong_PT_0850080110',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(products[index].imageUrl),
            title: Text(products[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Giá: ${products[index].price} VNĐ',
                  style: const TextStyle(
                    color: Colors.green, // Màu chữ là màu xanh lá cây
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(products[index].description),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailScreen(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final String description;
  final double price;

  Product(
      {required this.name,
      required this.imageUrl,
      required this.description,
      required this.price});
}
