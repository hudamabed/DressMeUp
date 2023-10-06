
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:logger/logger.dart';

import 'constant_network.dart';

class DioManagerClass {
  DioManagerClass._();
  static final DioManagerClass getInstance = DioManagerClass._();

  Dio? _dio;
  Dio init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ConstantNetwork.baseUrl,
        connectTimeout: 2000 * 60,
        receiveTimeout: 2000 * 60,
        sendTimeout: 2000 * 60,
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    _dio?.interceptors.add(ApiInterceptors());
    return _dio!;
  }

  Future<Response> dioGetMethod(
      {var url, Map<String, dynamic>? header , var queryParameters}) async {
    if (kDebugMode) {
      print("msg_sendde_url $url");
    }
    if (kDebugMode) {
      print("msg_sendde_header $header");
    }
    if (kDebugMode) {
      print("msg_sendde_QP ${queryParameters.toString()}");
    }

    return await _dio!.get(url,
        options: Options(headers: header), queryParameters: queryParameters);
  }

  Future<Response> dioPostMethod(
      {var url,
      Map<String, dynamic>? header,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    if (kDebugMode) {
      print("msg_sendde_url $url");
    }
    if (kDebugMode) {
      print("msg_sendde_header $header");
    }
    return await _dio!.post(
      url,
      queryParameters: queryParameters,
      options: Options(headers: header),
      data: body,
    );
  }

  Future<Response> dioPostFormMethod(
      {var url, Map<String, dynamic>? header, var body}) async {
    if (kDebugMode) {
      print("msg_request_url : $url");
    }
    if (kDebugMode) {
      print("msg_request_header : $header");
    }
    if (kDebugMode) {
      print("msg_request_body : $body");
    }
    return await _dio!.post(
      url,
      options: Options(headers: header),
      data: FormData.fromMap(body),
    );
  }

  Future<Response> dioUpdateMethod(
      {var url,
      Map<String, dynamic>? header,
      Map<String, dynamic>? body}) async {
    return await _dio!.put(url, options: Options(headers: header), data: body);
  }

  Future<Response> dioDeleteMethod(
      {var url,
      Map<String, dynamic>? header,
      Map<String, dynamic>? body}) async {
    return await _dio!
        .delete(url, options: Options(headers: header), data: body);
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    Logger().d(
        "onRequest : ${options.path} \n ${options.data} \n ${options.method}");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    Logger().d("onResponse : ${response.statusCode}");
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    Logger().d("onError : ${err.message}");
  }
}
