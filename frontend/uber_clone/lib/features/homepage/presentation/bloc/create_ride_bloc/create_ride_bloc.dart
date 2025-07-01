import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/auth/presentation/bloc/captain_auth_event.dart';
import 'package:uber_clone/features/homepage/data/create_ride_model.dart';
import 'package:uber_clone/features/homepage/domain/create_ride_repo.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/create_ride_bloc/create_ride_event.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/create_ride_bloc/create_ride_state.dart';

class CreateRideBloc extends Bloc<FetchCreateRideEvent, CreateRideState>{
  CreateRideBloc() : super(CreateRideInitialState()) {
    on<FetchCreateRideEvent>(_onCreateCaptainEvent);
  }

  Future<void> _onCreateCaptainEvent(
    FetchCreateRideEvent event,
    Emitter<CreateRideState> emit,
  ) async {
    emit(CreateRideLoadingState());
    try {
      final CreateRideResponse rideData = await CreateRideRepo().createRide(event.rideData);
      if (rideData.ride == null) {
        emit(CreateRideErrorState(errorMessage: 'No ride data found'));
        return;
      }
      final Ride ride = rideData.ride!;

      emit(CreateRideSuccessState(ride: ride));
    } catch (e) {
      emit(CreateRideErrorState(errorMessage: e.toString()));
    }
  }
}