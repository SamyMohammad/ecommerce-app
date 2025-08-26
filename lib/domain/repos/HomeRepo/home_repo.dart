 import 'package:ecommerce_app/core/errors/failuer.dart';
import 'package:ecommerce_app/data/model/categories_models/category.dart';
 import 'package:dartz/dartz.dart';

import '../../../data/model/brand_model/Brand.dart';

abstract class HomeRepo{

  Future<Either<Failure,List<Category>>>getCategory();
  Future<Either<Failure,List<Brand>>>getBrands();


}