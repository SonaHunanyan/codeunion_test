import 'package:auto_route/auto_route.dart';
import 'package:codeunion_test/presentation/model/home_type.dart';
import 'package:codeunion_test/presentation/router/app_router.dart';
import 'package:codeunion_test/presentation/theme/app_theme.dart';
import 'package:codeunion_test/presentation/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AutoTabsScaffold(
        routes: const [
          ProfileRoute(),
        ],
        bottomNavigationBuilder: (context, tabsRouter) => SizedBox(
          height: 83 * rh(context),
          child: BottomNavigationBar(
            backgroundColor: context.themeData.colorScheme.primaryContainer,
            currentIndex: 3,
            showUnselectedLabels: true,
            selectedItemColor: context.themeData.colorScheme.secondary,
            unselectedItemColor: context.themeData.secondaryHeaderColor,
            selectedLabelStyle:
                context.themeData.textTheme.displaySmall?.copyWith(
              color: context.themeData.colorScheme.secondary,
            ),
            unselectedLabelStyle: context.themeData.textTheme.displaySmall,
            onTap: (value) {},
            items: HomeType.values
                .map(
                  (e) => BottomNavigationBarItem(
                    label: e.title,
                    icon: _BottomBarItem(
                      icon: e.icon,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  const _BottomBarItem({required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5 * rh(context)),
      child: SizedBox(
        height: 17.0 * rh(context),
        width: 17.0 * rh(context),
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}
