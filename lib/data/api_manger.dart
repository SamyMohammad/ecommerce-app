import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiManger {
  final Dio dio;

  ApiManger(this.dio) {
    dio.interceptors.add(LogInterceptor(
        requestHeader: true,
        responseHeader: true,
        requestBody: true,
        responseBody: true,
        logPrint: (object) {
          debugPrint(object.toString());
        }));
  }
  final _baseUrl = 'https://ecommerce.routemisr.com/';

  //get request

  Future<Map<String, dynamic>> get(
      {required String endPoint, Map<String, dynamic>? queryParam}) async {
    var prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final headers = {
      if (token != null) 'token': token,
    };
    var response = await dio.get(
      "$_baseUrl$endPoint",
      queryParameters: queryParam,options: Options(headers: headers),

    );
    return response.data;
  }

  //post request

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic requestBody,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final headers = {
      if (token != null) 'token': token,
    };
    var response = await dio.post("$_baseUrl$endPoint",
        data: requestBody, options: Options(headers: headers));
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final headers = {
      if (token != null) 'token': token,
    };
    var response = await dio.delete(
      "$_baseUrl$endPoint",options: Options(headers: headers),
    );
    return response.data;
  }
  Future<Map<String, dynamic>> put({
    required String endPoint,
    required dynamic requestBody,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final headers = {
      if (token != null) 'token': token,
    };
    var response = await dio.put("$_baseUrl$endPoint",
        data: requestBody, options: Options(headers: headers));
    return response.data;
  }

}
