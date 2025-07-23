import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/auth/domain/user_auth_repository.dart';
import 'package:uber_clone/features/auth/data/user_model/get_user.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_fetch_event.dart';
import 'package:uber_clone/features/auth/presentation/bloc/user_fetch_state.dart';

class UserFetchBloc extends Bloc<UserFetchEvent, UserFetchState> {
  UserFetchBloc() : super(UserFetchInitial()) {
    on<GetUserEvent>(_onGetUser);
  }

  Future<void> _onGetUser(
    GetUserEvent event,
    Emitter<UserFetchState> emit,
  ) async {
    emit(UserFetchLoading());
    try {
      GetUser userData = await UserAuthRepository().getUser();
      emit(UserFetched(userData));
    } catch (e) {
      emit(UserFetchError(e.toString()));
    }
  }
}
