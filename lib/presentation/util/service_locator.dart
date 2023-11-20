import 'package:codeunion_test/data/local_storage/shared_prefs.dart';
import 'package:codeunion_test/data/repository/auth_repository.dart';
import 'package:codeunion_test/domain/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> setupDependencies() async {
  await SharedPrefs().init();
  GetIt.I.registerSingleton<IAuthRepository>(AuthRepository());
}
