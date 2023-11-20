import 'package:codeunion_test/presentation/theme/app_strings.dart';

class Validators {
  static String? emptyValidators(String value) {
    if (value.isEmpty) {
      return AppStrings.valueRequired;
    }
    return null;
  }
}
