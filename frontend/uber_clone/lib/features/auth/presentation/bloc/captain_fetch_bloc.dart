import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/auth/domain/captain_auth_repository.dart';
import 'package:uber_clone/features/auth/data/captain_model/get_captain.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_fetch_event.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_fetch_state.dart';

class CaptainFetchBloc extends Bloc<CaptainFetchEvent, CaptainFetchState> {
  CaptainFetchBloc() : super(CaptainFetchInitial()) {
    on<GetCaptainEvent>(_onGetCaptain);
  }

  Future<void> _onGetCaptain(
    GetCaptainEvent event,
    Emitter<CaptainFetchState> emit,
  ) async {
    emit(CaptainFetchLoading());
    try {
      GetCaptain captainData = await CaptainAuthRepository().getCaptain();
      emit(CaptainFetched(captainData));
    } catch (e) {
      emit(CaptainFetchError(e.toString()));
    }
  }
}
