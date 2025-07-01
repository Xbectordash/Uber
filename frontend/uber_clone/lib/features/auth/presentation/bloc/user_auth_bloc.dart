import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/auth/domain/user_auth_repository.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_auth_event.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  UserAuthBloc() : super(UserAuthInitial()) {
    on<CreateUserEvent>(_onCreateUser);
    on<LoginUserEvent>(_onLoginUser);
  }

  Future<void> _onCreateUser(
    CreateUserEvent event,
    Emitter<UserAuthState> emit,
  ) async {
    emit(UserAuthLoading());
    try {
      await UserAuthRepository().userSignup(event.createUser);
      emit(UserCreated());
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }

  Future<void> _onLoginUser(
    LoginUserEvent event,
    Emitter<UserAuthState> emit,
  ) async {
    emit(UserAuthLoading());
    try {
      debugPrint(
        'In bloc : Email: ${event.loginUser.email}, Password: ${event.loginUser.password}',
      );
      await UserAuthRepository().userSignIn(event.loginUser);
      emit(UserLoggedIn());
    } catch (e) {
      emit(UserAuthError(e.toString()));
    }
  }
}
