import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/auth/domain/captain_auth_repository.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_auth_event.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_auth_state.dart';

class CaptainAuthBloc extends Bloc<CaptainAuthEvent, CaptainAuthState> {
  CaptainAuthBloc() : super(CaptainAuthInitial()) {
    on<CreateCaptainEvent>(_onCreateCaptain);
    on<LoginCaptainEvent>(_onLoginCaptain);
  }

  Future<void> _onCreateCaptain(
    CreateCaptainEvent event,
    Emitter<CaptainAuthState> emit,
  ) async {
    emit(CaptainAuthLoading());
    try {
      await CaptainAuthRepository().captainSignup(event.createCaptain);
      emit(CaptainCreated());
    } catch (e) {
      emit(CaptainAuthError(e.toString()));
    }
  }

  Future<void> _onLoginCaptain(
    LoginCaptainEvent event,
    Emitter<CaptainAuthState> emit,
  ) async {
    emit(CaptainAuthLoading());
    try {
      await CaptainAuthRepository().captainSignIn(event.loginCaptain);
      emit(CaptainLoggedIn());
    } catch (e) {
      emit(CaptainAuthError(e.toString()));
    }
  }
}
