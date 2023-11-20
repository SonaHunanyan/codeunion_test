import 'package:codeunion_test/app.dart';
import 'package:codeunion_test/presentation/extension/bloc_observer.dart';
import 'package:codeunion_test/presentation/util/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await setupDependencies();

  runApp(App());
}
