import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/homepage/data/get_distance_time_model.dart';
import 'package:uber_clone/features/homepage/domain/get_distance_time_repo.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_distance_time/get_distance_time_event.bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_distance_time/get_distance_time_state.dart';

class GetDistanceTimeBloc extends Bloc<GetDistanceTimeEvent, GetDistanceTimeState> {
  GetDistanceTimeBloc() : super(IntialGetDistanceTimeState()) {
    on<FetchDistanceTimeEvent>(_onFetchDistanceTimeEvent);
  }
}

Future<void> _onFetchDistanceTimeEvent(
  FetchDistanceTimeEvent event,
  Emitter<GetDistanceTimeState> emit,
) async {
  try {
    debugPrint('[GetDistanceTimeBloc] FetchDistanceTimeEvent received: origin=${event.origin}, destination=${event.destination}');
    emit(LoadingGetDistanceTimeState());
    final GetDistanceTime rawDistanceTime = await GetDistanceTimeRepo().getDistanceTime(event.origin, event.destination);
    debugPrint('[GetDistanceTimeBloc] API response: distanceTime=${rawDistanceTime.distanceTime}');
    if (rawDistanceTime.distanceTime == null) {
      print('[GetDistanceTimeBloc] No distance and time data found');
      emit(ErrorGetDistanceTimeState('No distance and time data found'));
      return;
    }
    final DistanceTime? distanceTime = rawDistanceTime.distanceTime;
   debugPrint('[GetDistanceTimeBloc] Loaded distanceTime: $distanceTime');
    emit(LoadedGetDistanceTimeState(distanceTime: distanceTime!));
  } catch (e) {
    debugPrint('[GetDistanceTimeBloc] Error: $e');
    emit(ErrorGetDistanceTimeState('Failed to fetch distance and time: \\${e.toString()}'));
  }
}


