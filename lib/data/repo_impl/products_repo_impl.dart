import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/data/model/cart_model/CartResponse.dart';
import 'package:ecommerce_app/data/model/products/ProductResponse.dart';

import '../../core/errors/failuer.dart';
import '../../domain/repos/ProductsRepo/products_repo.dart';
import '../model/products/product.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ApiManger apiManger;

  ProductsRepoImpl(this.apiManger);
  @override
  Future<Either<Failure, List<Product>>> getProducts(
      {String? subCategory, String? category, String? brand}) async {
    try {
      Map<String, dynamic> params = {};
      if (subCategory != null) {
        params["subcategory[in]"] = subCategory;
      }
      if (category != null) {
        params["category[in]"] = category;
      }
      if (brand != null) {
        params["brand"] = brand;
      }

      var response =
          await apiManger.get(endPoint: 'api/v1/products', queryParam: params);
      var productResponse = ProductResponse.fromJson(response);
      return right(productResponse.data ?? []);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> addWashList({required String id}) async {
    try {
      var response = await apiManger
          .post(endPoint: 'api/v1/wishlist', requestBody: {"productId": id});

      final message = response["message"] ?? "";
      if (message != null) {
        return Right(message);
      } else {
        return Left(ServerFailure('Unexpected response format'));
      }
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> removeWashList({required String id}) async {
    try {
      var response = await apiManger.delete(
        endPoint: 'api/v1/wishlist/$id',
      );
      final message = response["message"] ?? "";
      if (message != null) {
        return Right(message);
      } else {
        return Left(ServerFailure('Unexpected response format'));
      }
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addCart({required String id}) async {
    try {
      var response = await apiManger.post(
        endPoint: 'api/v1/cart',
        requestBody: {"productId": id},
      );
      final message = response["message"] ?? "";
      if (message != null) {
        return Right(message);
      } else {
        return Left(ServerFailure('Unexpected response format'));
      }
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartData>> getCart() async {
    try {
      var response = await apiManger.get(endPoint: "api/v1/cart");
      CartResponse cartResponse = CartResponse.fromJson(response);
      return right(cartResponse.data!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartData>> deleteCart({required String id}) async {
    try {
      var response = await apiManger.delete(
        endPoint: 'api/v1/cart/$id',
      );
      CartResponse cartResponse = CartResponse.fromJson(response);
      return right(cartResponse.data!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  @override
  Future<Either<Failure, CartData>> putCart({required String id,required int count}) async {
    try {
      var response = await apiManger.put(
        endPoint: 'api/v1/cart/$id', requestBody:{"count":count},
      );
      CartResponse cartResponse = CartResponse.fromJson(response);
      return right(cartResponse.data!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}
