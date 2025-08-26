import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/data/model/sub_category_model/SubCategory.dart';
import 'package:ecommerce_app/data/model/sub_category_model/SubCategoryResponse.dart';
import 'package:ecommerce_app/domain/repos/subCategoriesRepo/sub_category_repo.dart';

import '../../core/errors/failuer.dart';

class SubCategoryRepoImpl implements SubCategoryRepo{
  final ApiManger apiManger;

  SubCategoryRepoImpl(this.apiManger);

  @override
  Future<Either<Failure, List<SubCategory>>> getSubCategory(String catId)async {
    
   try {
     var response=await apiManger.get(endPoint:"api/v1/categories/$catId/subcategories" );
      var subCategoryResponse=SubCategoryResponse.fromJson(response);
      return right(subCategoryResponse.data ??[]);
   }  catch (e) {
     if (e is DioException) {
       return left(ServerFailure.fromDioError(e));
     }
     return left(ServerFailure(e.toString()));
   }
    

  }
}