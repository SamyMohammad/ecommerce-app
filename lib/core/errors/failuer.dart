import 'package:dio/dio.dart';


abstract class Failure{
  final String errorMassage;

  Failure(this.errorMassage);
}
class ServerFailure extends Failure{
  ServerFailure(super.errorMassage);

  factory ServerFailure.fromDioError(DioException dioError){
    switch(dioError.type){

      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with Api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout with Api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout with Api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with Api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponseError(dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('request cancel with server');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet');
      case DioExceptionType.unknown:
        return ServerFailure('oops there was an error ,please try again');
       default:
        return ServerFailure('oops there was an error ,please try again');
    }
  }
  // factory ServerFailure.fromResponseError(int statusCode,dynamic response){
  //   if(statusCode == 400 || statusCode ==401 ||statusCode==402 ||statusCode==403){
  //     return ServerFailure(response['error']['message']);
  //   }else if(statusCode == 404){
  //     return ServerFailure('your request not found , please try again');
  //
  //   }else if(statusCode ==500){
  //     return ServerFailure('Internal server error');
  //   }else{
  //     return ServerFailure('oops there was an error ,please try again');
  //   }
  // }
  factory ServerFailure.fromResponseError(int statusCode, dynamic response) {
    try {
      if (response is Map<String, dynamic>) {
        // حالة وجود 'message' مباشرة في الاستجابة
        if (response.containsKey('message')) {
          return ServerFailure(response['message']);
        }
        // أحيانًا تكون الرسالة داخل 'error' أو 'errors'
        if (response['error'] is Map && response['error']['message'] != null) {
          return ServerFailure(response['error']['message']);
        }
        if (response['errors'] is Map) {
          // لو فيه errors زي {"param": ..., "msg": ...}
          final firstError = response['errors'].values.first;
          if (firstError is String) {
            return ServerFailure(firstError);
          }
        }
      }

      if (statusCode == 404) {
        return ServerFailure('Your request was not found, please try again.');
      } else if (statusCode == 500) {
        return ServerFailure('Internal server error');
      }

      return ServerFailure('Oops! Something went wrong. Please try again.');
    } catch (e) {
      // fallback لو حصل parsing error
      return ServerFailure('Unexpected error format from server');
    }
  }

}
