import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/data/model/brand_model/BrandModel.dart';
import 'package:ecommerce_app/data/model/categories_models/CategoriesResponse.dart';
import 'package:ecommerce_app/domain/repos/HomeRepo/home_repo.dart';
import '../../core/errors/failuer.dart';
import '../model/brand_model/Brand.dart';
import '../model/categories_models/category.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiManger apiManger;

  HomeRepoImpl(this.apiManger);

  @override
  Future<Either<Failure, List<Category>>> getCategory() async {
    try {
      var response = await apiManger.get(endPoint: 'api/v1/categories');
      var categoryResponse = CategoriesResponse.fromJson(response);
      return right(categoryResponse.data ?? []);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, List<Brand>>> getBrands()async {
    try {
      var response=await apiManger.get(endPoint: "api/v1/brands");
      var brandResponse=BrandModel.fromJson(response);
      return right(brandResponse.data??[]);
    }  catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }

  }
}
