import 'package:codeunion_test/domain/entity/user/user.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class UserLoadedState extends ProfileState {
  UserLoadedState({required this.user});
  final User user;
}

class LogoutSuccessState extends ProfileState {}
