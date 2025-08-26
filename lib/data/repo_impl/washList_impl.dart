import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/data/model/products/ProductResponse.dart';
import 'package:ecommerce_app/domain/repos/WahListRepo/wash_list_repo.dart';

import '../../core/errors/failuer.dart';
import '../model/products/product.dart';

class WashListImpl implements WashListRepo{
 final ApiManger apiManger;

  WashListImpl(this.apiManger);
  @override
  Future<Either<Failure,List<Product>>> getWashList()async {
      try {
        var response=await apiManger.get(endPoint:"api/v1/wishlist");
        var washListResponse=ProductResponse.fromJson(response);
        return right(washListResponse.data ?? []);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        } else {
          return left(ServerFailure(e.toString()));
        }
      }
  }
}