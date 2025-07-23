import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/homepage/domain/get_fare_repo.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_fare/get_fare_event.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_fare/get_fare_state.dart';

class GetFareBloc extends Bloc<GetFareEvent, GetFareState> {
  GetFareBloc() : super(InitialGetFareState()) {
    on<FetchFareEvent>(_onFetchFareEvent);
  }

  Future<void> _onFetchFareEvent(
    FetchFareEvent event,
    Emitter<GetFareState> emit,
  ) async {
    try {
      emit(LoadingGetFareState());
      final fare = await GetFareRepo().getFare(event.pickup, event.destination);
      emit(LoadedGetFareState(fare: fare));
    } catch (e) {
      emit(ErrorGetFareState(e.toString()));
    }
  }
}
