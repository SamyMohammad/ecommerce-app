import 'package:flutter/material.dart';

class AppConstants {
  static const String delete = "Delete";
  static const String searchHint = "What do you search for?";
  static const String addToCart = "Add to cart";

  static List<Product> favoriteProducts = [
    const Product(
        title: "Backpack",
        finalPrice: "109.95",
        color: Color.fromARGB(255, 1, 33, 59),
        imageUrl: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        salePrice: "120"),
    const Product(
        title: "T-Shirts",
        finalPrice: "22.3",
        color: Color.fromARGB(255, 216, 222, 226),
        imageUrl:
            "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
        salePrice: "25"),
    const Product(
        title: "Mens Cotton Jacket",
        finalPrice: "60",
        color: Color.fromARGB(255, 247, 206, 130),
        imageUrl: "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
        salePrice: "65"),
    const Product(
        title: "Mens Casual Slim Fit",
        finalPrice: "15",
        color: Color.fromARGB(255, 72, 163, 224),
        imageUrl: "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg"),
    const Product(
        title: "Solid Gold Petite Micropave",
        finalPrice: "22.3",
        color: Color.fromARGB(255, 189, 189, 199),
        imageUrl:
            "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
        salePrice: "25"),
  ];
}

class Product {
  const Product(
      {required this.title,
      required this.imageUrl,
      required this.finalPrice,
      this.salePrice,
      required this.color});
  final String title;
  final Color color;
  final String finalPrice;
  final String imageUrl;

  final String? salePrice;
}
