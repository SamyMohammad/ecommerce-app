import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failuer.dart';
import 'package:ecommerce_app/data/model/products/product.dart';

import '../../../data/model/cart_model/CartResponse.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<Product>>> getProducts(
      {String? subCategory, String? category, String? brand});
  Future<Either<Failure,String>>addWashList({required String id});
  Future<Either<Failure,String>>removeWashList({required String id});
  Future<Either<Failure,String>>addCart({required String id});
  Future<Either<Failure,CartData>>getCart();
  Future<Either<Failure,CartData>>deleteCart({required String id});
  Future<Either<Failure,CartData>>putCart({required String id,required int count});

}
