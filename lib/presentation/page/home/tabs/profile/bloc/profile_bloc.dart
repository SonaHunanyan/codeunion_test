import 'package:codeunion_test/domain/repository/auth_repository.dart';
import 'package:codeunion_test/presentation/page/home/tabs/profile/bloc/profile_event.dart';
import 'package:codeunion_test/presentation/page/home/tabs/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required this.authRepository,
  }) : super(ProfileInitialState()) {
    on<GetUserEvent>(_onGetUserEvent);
    on<LogoutEvent>(_onLogoutEvent);
  }

  final IAuthRepository authRepository;

  Future<void> _onGetUserEvent(
      GetUserEvent event, Emitter<ProfileState> emit) async {
    final user = authRepository.user;
    if (user != null) {
      emit(UserLoadedState(user: user));
    }
  }

  Future<void> _onLogoutEvent(
      LogoutEvent event, Emitter<ProfileState> emit) async {
    authRepository.logout();
    emit(LogoutSuccessState());
  }
}
