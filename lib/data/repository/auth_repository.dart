import 'package:codeunion_test/data/constant/app_url.dart';
import 'package:codeunion_test/data/http/dio.dart';
import 'package:codeunion_test/domain/entity/api_response/api_error.dart';
import 'package:codeunion_test/domain/entity/api_response/api_response.dart';
import 'package:codeunion_test/domain/entity/login_response/login_response.dart';
import 'package:codeunion_test/domain/entity/token/token.dart';
import 'package:codeunion_test/domain/entity/user/user.dart';
import 'package:codeunion_test/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepository implements IAuthRepository {
  @override
  Token? get token => _token;
  @override
  User? get user => _user;

  Token? _token;
  User? _user;

  @override
  Future<ApiResponse<LoginResponse>> login(
      {required String email, required String password}) async {
    try {
      final params = <String, dynamic>{'email': email, 'password': password};
      final resp = await dio.post(
        AppUrl.login,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
        data: params,
      );
      final result = LoginResponse.fromJson(resp.data);
      _token = result.tokens;
      _user = result.user;
      return ApiResponse(result: result);
    } on DioException catch (e) {
      return ApiResponse(
        error: ApiError(
          data: e.response?.data,
          statusCode: e.response?.statusCode,
          description: e.response?.statusMessage,
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
