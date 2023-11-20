import 'package:codeunion_test/domain/entity/token/token.dart';
import 'package:codeunion_test/domain/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

class GetActualToken {
  static final _authRepo = GetIt.I.get<IAuthRepository>();
  static Future<Token?> execute() async {
    try {
      return _authRepo.token;
    } catch (e) {
      return null;
    }
  }
}
