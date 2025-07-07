import 'package:bloc/bloc.dart';
import 'package:uber_clone/features/homepage/domain/start_ride_repo.dart';

import 'start_ride_event.dart';
import 'start_ride_state.dart';

class StartRideBloc extends Bloc<StartRideEvent, StartRideState> {


  StartRideBloc() : super(StartRideInitial()) {
    on<StartRideRequested>(_onStartRideRequested);
  }

  Future<void> _onStartRideRequested(
    StartRideRequested event,
    Emitter<StartRideState> emit,
  ) async {
    emit(StartRideLoading());
    try {
      await StartRideRepo().startRide(event.rideId, event.otp);
      emit(StartRideSuccess());
    } catch (e) {
      emit(StartRideFailure(e.toString()));
    }
  }
}
