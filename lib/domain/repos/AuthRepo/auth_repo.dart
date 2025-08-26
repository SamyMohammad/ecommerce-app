import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failuer.dart';
import 'package:ecommerce_app/data/model/auth_model/AuthResponse.dart';
import 'package:ecommerce_app/data/model/auth_model/signup_model/SignUpRequest.dart';

import '../../../data/model/auth_model/login_request/LoginRequest.dart';

abstract class AuthRepo{

  Future<Either<Failure,AuthResponse>> login(LoginRequest loginRequest);
  Future<Either<Failure,AuthResponse>> signUp(SignUpRequest signupRequest) ;


}