import 'package:codeunion_test/data/local_storage/shared_prefs.dart';

Future<void> setupDependencies() async {
  await SharedPrefs().init();
}
