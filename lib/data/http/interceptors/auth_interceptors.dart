import 'package:codeunion_test/domain/use_case/get_actual_token.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await GetActualToken.execute();
    final accessToken = token?.accessToken;
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }
}
