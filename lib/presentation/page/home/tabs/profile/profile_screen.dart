import 'package:auto_route/auto_route.dart';
import 'package:codeunion_test/domain/entity/user/user.dart';
import 'package:codeunion_test/presentation/page/home/tabs/profile/bloc/profile_bloc.dart';
import 'package:codeunion_test/presentation/page/home/tabs/profile/bloc/profile_event.dart';
import 'package:codeunion_test/presentation/page/home/tabs/profile/bloc/profile_state.dart';
import 'package:codeunion_test/presentation/page/home/tabs/profile/widgets/widgets.dart';
import 'package:codeunion_test/presentation/page/widgets/custom_app_bar.dart';
import 'package:codeunion_test/presentation/theme/app_strings.dart';
import 'package:codeunion_test/presentation/theme/app_theme.dart';
import 'package:codeunion_test/presentation/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ProfileScreen> {
  User? _user;

  final _bloc = ProfileBloc(authRepository: GetIt.I.get());

  @override
  void initState() {
    _bloc.add(GetUserEvent());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => _bloc,
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: blocListener,
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) => Scaffold(
            backgroundColor: context.themeData.scaffoldBackgroundColor,
            appBar: CustomAppBar(
              context,
              title: AppStrings.profile,
            ),
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 38 * rh(context),
                  ),
                  const AvatarWidget(),
                  SizedBox(
                    height: 15 * rh(context),
                  ),
                  Text(
                    _user?.nickname ?? '',
                    style: context.themeData.textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 12 * rh(context),
                  ),
                  Text(
                    _user?.email ?? '',
                    style: context.themeData.textTheme.bodyMedium?.copyWith(
                      color: context.themeData.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 27 * rh(context),
                  ),
                  LogoutButton(
                    onTap: () {
                      _bloc.add(LogoutEvent());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension _StateAddititon on _State {
  void blocListener(BuildContext context, ProfileState state) {
    if (state is UserLoadedState) {
      _user = state.user;
    }
    if (state is LogoutSuccessState) {
      context.router.popUntil((route) => route.data?.name == 'AuthRoute');
    }
  }
}
