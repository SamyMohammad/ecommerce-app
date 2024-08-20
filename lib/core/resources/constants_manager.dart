import 'package:flutter/material.dart';

class AppConstants {
  static const String delete = "Delete";
  static const String searchHint = "What do you search for?";
  static const String addToCart = "Add to cart";

  static List<Product> favoriteProducts = [
    const Product(
        title: "Shoes",
        finalPrice: "109.95",
        color: Color.fromARGB(255, 1, 33, 59),
        imageUrl: "https://s3-alpha-sig.figma.com/img/a434/c8f5/becb2cf90b140b5af08945a5ee61e536?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=NGtU0NXoeog6upzaakLakZTqmtYqrPAxODcxd3YnGEqPFdGbzuk4LL2xwJgNF~kexZPCNkj8aDwUS0T48PU0c7m3dYGK5WnMbrpLFaY3hoMEOubimEnmuelxR-vz~bcoOxHHzmYZ9mp0t6mMfR36Lrk8TSwX5MWATG7YHnZHWQxAoitNCgrpZByo3oqOENpF3tE1R-q~z99FXN3RI~RZ55gL-FKB0MPsu8RLhO1q~P8XSZQQ5j0~P6MAzh2RFKUz1a56yP5wuYCx7edAR12ACAsg8tO7UXneD-LBxaAkyAHoPJbcnmVM9QV3N~7sPbKmd3bTyo3LtJgq9zPMLRHUaw__",
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
