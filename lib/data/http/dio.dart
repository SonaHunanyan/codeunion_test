import 'dart:developer';

import 'package:codeunion_test/data/constant/app_url.dart';
import 'package:dio/dio.dart';
import 'interceptors/auth_interceptors.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: AppUrl.baseUrl,
    connectTimeout: const Duration(milliseconds: 20000),
  ),
);

void initDio() {
  dio.interceptors.addAll([
    AuthInterceptor(),
    LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: (e) {
          log(e.toString());
        })
  ]);
}
