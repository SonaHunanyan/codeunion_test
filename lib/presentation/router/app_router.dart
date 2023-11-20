import 'package:auto_route/auto_route.dart';
import 'package:codeunion_test/presentation/page/auth/auth_screen.dart';
import 'package:codeunion_test/presentation/page/home/home_screen.dart';
import 'package:codeunion_test/presentation/page/home/tabs/profile/profile_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(
              page: ProfileRoute.page,
            )
          ],
        )
      ];
}
