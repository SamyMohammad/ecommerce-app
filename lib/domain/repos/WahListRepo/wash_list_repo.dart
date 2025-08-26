import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failuer.dart';
import 'package:ecommerce_app/data/model/products/product.dart';

abstract class WashListRepo{
  Future<Either<Failure,List<Product>>>getWashList();
}