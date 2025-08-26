class CartResponse {
  String? status;
  String? cartId;
  CartData? data;

  CartResponse({
    this.status,
    this.cartId,
    this.data,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      status: json['status'],
      cartId: json['cartId'],
      data: CartData.fromJson(json),
    );
  }
}

class CartData {
  num numOfCartItems;
  List<CartItem> cart;

  CartData({
    required this.numOfCartItems,
    required this.cart,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      numOfCartItems: json['numOfCartItems'] ?? 0,
      cart: (json['data']['products'] as List)
          .map((e) => CartItem.fromJson(e))
          .toList(),
    );
  }
}

class CartItem {
  ProductDataEnt product;
  int count;
  int price;

  CartItem({
    required this.product,
    required this.count,
    required this.price,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: ProductDataEnt.fromJson(json['product']),
      count: json['count'] ?? 0,
      price: json['price'] ?? 0,
    );
  }
}

class ProductDataEnt {
  String title;
  num ratingsAverage;
  num quantity;
  String imageCover;
  String id;

  ProductDataEnt({
    required this.id,
    required this.title,
    required this.ratingsAverage,
    required this.imageCover,
    required this.quantity,
  });

  factory ProductDataEnt.fromJson(Map<String, dynamic> json) {
    return ProductDataEnt(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      ratingsAverage: json['ratingsAverage'] ?? 0.0,
      imageCover: json['imageCover'] ?? '',
      quantity: json['quantity'] ?? 0,
    );
  }
}
