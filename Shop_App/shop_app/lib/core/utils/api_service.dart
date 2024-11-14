import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final _baseUrl = 'https://student.valuxapps.com/api/';
  final Dio _dio;
  ApiService(this._dio);
  Future<dynamic> get({required String endPoint, String? token}) async {
    Map<String, String> headers = {'lang': 'en'};
    if (token != null) {
      headers.addAll({'Authorization': token});
    }
    var response = await _dio.get('$_baseUrl$endPoint',
        options: Options(headers: headers));
    return response;
  }

  Future<dynamic> post(
      {required String endPoint, @required dynamic body, String? token}) async {
    Map<String, String> headers = {'lang': 'en'};
    if (token != null) {
      headers.addAll({'Authorization': token});
    }
    var response = await _dio.post('$_baseUrl$endPoint',
        options: Options(headers: headers), data: body);
    return response;
  }

  Future<dynamic> put(
      {required String endPoint, @required dynamic body, String? token}) async {
    Map<String, String> headers = {'lang': 'en'};
    if (token != null) {
      headers.addAll({'Authorization': token});
    }
    var response = await _dio.put('$_baseUrl$endPoint',
        options: Options(headers: headers), data: body);
    return response;
  }
}
