import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/domain/repos/AuthRepo/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/errors/failuer.dart';
import '../model/auth_model/AuthResponse.dart';
import '../model/auth_model/login_request/LoginRequest.dart';
import '../model/auth_model/signup_model/SignUpRequest.dart';

class AuthRepoImpl implements AuthRepo{

  final ApiManger apiManger;

  AuthRepoImpl(this.apiManger);

  @override
  Future<Either<Failure, AuthResponse>> login(LoginRequest loginRequest)async {
    final SharedPreferences  preferences=await SharedPreferences.getInstance();
   try {
     var response=await apiManger.post(endPoint:"api/v1/auth/signin",requestBody: loginRequest.toJson());
     var authResponse=AuthResponse.fromJson(response);
     preferences.setString("token", authResponse.token??"");
     return right(authResponse);
   }  catch (e) {
     if(e is DioException){
       return left(ServerFailure.fromDioError(e));
     }else{
       return left(ServerFailure(e.toString()));
     }

   }
  }
  @override
  Future<Either<Failure, AuthResponse>> signUp(SignUpRequest signupRequest)async {

    try {
     var response =await apiManger.post(endPoint:"api/v1/auth/signup",requestBody: signupRequest.toJson());
     var authResponse=AuthResponse.fromJson(response);

     return right(authResponse);

   }  catch (e) {
     if(e is DioException){
       return left(ServerFailure.fromDioError(e));
     }else{
       return left(ServerFailure(e.toString()));
     }
   }

  }
}