import 'dart:async';
import 'dart:developer';

import '../Router/Router.dart';
import '../helper/alerts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/myLoading.dart';
import '../config/config.dart';
import '../utiles/utiles.dart';

class DioService {
  Dio _mydio = Dio();

  DioService([String baseUrl = AppConfig.baseUrl, BaseOptions? options]) {
    _mydio = Dio(
      BaseOptions(
          headers: {
            "Accept": "application/json",
            'Content-Type': "application/x-www-form-urlencoded",
          },
          baseUrl: baseUrl,
          contentType: "application/x-www-form-urlencoded",
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(milliseconds: 30000),
          receiveTimeout: const Duration(milliseconds: 30000),
          sendTimeout: const Duration(milliseconds: 30000)),
    )..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
  }

  Future<ApiResponse> postData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    bool loading = false,
    bool isForm = false,
    bool isFile = false,
  }) async {
    _mydio.options.headers["Authorization"] = 'Bearer ${Utils.token}';
    if (isFile == true)
      _mydio.options.headers["Content-Type"] = 'multipart/form-data';
    print(FormData.fromMap(body ?? {}).fields);
    try {
      if (loading) {
        MyLoading.show();
      }
      final response = await _mydio.post(url,
          queryParameters: query,
          data: isForm ? FormData.fromMap(body ?? {}) : body);
      if (loading) {
        MyLoading.dismis();
      }
      return checkForSuccess(response);
    } on DioException catch (e) {
      return getDioException(
        e: e,
      );
    }
  }

  Future<ApiResponse> putData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    bool loading = false,
    bool isForm = false,
  }) async {
    //_mydio.options.headers["Authorization"] = 'Bearer ${Utils.token}';
    try {
      if (loading) {
        MyLoading.show();
      }
      final response = await _mydio.put(url,
          queryParameters: query,
          data: isForm ? FormData.fromMap(body ?? {}) : body);
      if (loading) {
        MyLoading.dismis();
      }
      return checkForSuccess(response);
    } on DioException catch (e) {
      return getDioException(
        e: e,
      );
    }
  }

  Future<ApiResponse> deleteData({
    required String url,
    Map<String, dynamic>? query,
    bool loading = false,
  }) async {
    _mydio.options.headers["Authorization"] = 'Bearer ${Utils.token}';

    try {
      if (loading) {
        MyLoading.show();
      }
      final response = await _mydio.delete(url, queryParameters: query);
      if (loading) {
        MyLoading.dismis();
      }
      return checkForSuccess(response);
    } on DioException catch (e) {
      return getDioException(
        e: e,
      );
    }
  }

  Future<ApiResponse> getData({
    required String url,
    Map<String, dynamic>? query,
    bool loading = false,
  }) async {
    _mydio.options.headers["Authorization"] = 'Bearer ${Utils.token}';

    try {
      if (loading) {
        MyLoading.show();
      }
      final response = await _mydio.get(url, queryParameters: query);
      if (loading) {
        MyLoading.dismis();
      }
      return checkForSuccess(response);
    } on DioException catch (e) {
      return getDioException(
        e: e,
      );
    }
  }

  FutureOr<ApiResponse> getDioException({
    required DioException e,
  }) async {
    log("---------------autherrr");
    MyLoading.dismis();

    if (DioExceptionType.receiveTimeout == e.type ||
        DioExceptionType.connectionTimeout == e.type) {
      Alerts.snack(text: "Connetion timeout", state: SnackState.failed);
      log('case 1');
      log('Server is not reachable. Please verify your internet connection and try again');
    } else if (DioExceptionType.badResponse == e.type) {
      log('case 2');
      log('Server reachable. Error in resposne');
      Alerts.snack(
          text: e.response?.data["message"] ?? "لا يمكن الوصول للسيرفير",
          state: SnackState.failed);

      log("hello im errroe");
      if (e.response?.data["message"]?.contains("Unauthenticated") ?? false) {
        await Utils.dataManager.deleteUserData();
        Navigator.of(Utils.navigatorKey().currentContext!)
            .pushNamedAndRemoveUntil(
          Routes.AuthScreen,
          (route) => false,
        );
      }
      if (e.response?.statusCode == 401) {
        await Utils.dataManager.deleteUserData();
        Navigator.of(Utils.navigatorKey().currentContext!)
            .pushNamedAndRemoveUntil(
          Routes.AuthScreen,
          (route) => false,
        );
        // Utils.navKey.currentState!.pushNamedAndRemoveUntil(
        //   "/login",
        //   (route) => false,
        // );
      }
    } else if (DioExceptionType.connectionError == e.type) {
      if (e.message!.contains('SocketException')) {
        log('Network error');
        log('case 3');
        Alerts.snack(text: "No Network", state: SnackState.failed);
      }
    } else {
      // show snak server error

      log('case 4');
      log('Problem connecting to the server. Please try again.');
    }
    return ApiResponse(isError: true, response: e.response);
  }

  ApiResponse checkForSuccess(Response response) {
    if ((response.data["status"]) == "Success") {
      return ApiResponse(isError: false, response: response);
    } else {
      Alerts.snack(text: response.data["error"], state: SnackState.failed);
      return ApiResponse(isError: true, response: response);
    }
  }
}

class ApiResponse {
  bool isError;
  Response? response;
  ApiResponse({this.response, required this.isError});
}

class xx extends DioService {
  xx() : super();
}
