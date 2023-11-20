import 'package:codeunion_test/domain/entity/api_response/api_error.dart';

class ApiResponse<T> {
  ApiResponse({
    this.error,
    this.result,
  });
  final T? result;
  final ApiError? error;
}
