import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failuer.dart';
import 'package:ecommerce_app/data/model/sub_category_model/SubCategory.dart';

abstract class SubCategoryRepo{


  Future<Either<Failure,List<SubCategory>>>getSubCategory(String catId);
}