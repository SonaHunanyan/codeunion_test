import 'package:codeunion_test/domain/entity/api_response/api_response.dart';
import 'package:codeunion_test/domain/entity/login_response/login_response.dart';
import 'package:codeunion_test/domain/entity/token/token.dart';
import 'package:codeunion_test/domain/entity/user/user.dart';

abstract class IAuthRepository {
  Token? get token;

  User? get user;

  Future<ApiResponse<LoginResponse>> login(
      {required String email, required String password});

  void logout();
}
