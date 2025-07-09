import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/homepage/data/get_routes_model.dart';
import 'package:uber_clone/features/homepage/domain/get_route_repo.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_route_bloc/get_route_event.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_route_bloc/get_route_state.dart';

class GetRoutesBloc extends Bloc<GetRouteEvent, GetRoutesState> {
  GetRoutesBloc() : super(IntialGetRoutesState()) {
    on<FetchRoutesEvent>(_onFetchRoutesEvent);
    on<ResetRoutesEvent>(_resetEvent);
  }
}

Future<void> _onFetchRoutesEvent(
  FetchRoutesEvent event,
  Emitter<GetRoutesState> emit,
) async {
  try {
    debugPrint('[GetRoutesBloc] FetchDistanceTimeEvent received: origin=${event.origin}, destination=${event.destination}');
    emit(LoadingGetRoutesState());
    final GetRouteModel routeData = await GetRouteRepo().getRoute(event.origin, event.destination);
    debugPrint('[GetRoutesBloc] API response: distanceTime=${routeData.distanceTime}');
    if (routeData.distanceTime!.polyline == null) {
      debugPrint('[GetRoutesBloc] No distance and time data found');
      emit(ErrorGetRoutesState('No distance and time data found'));
      return;
    }
    final originLatLng = routeData.distanceTime!.legs![0].startLocation;
     final destLatLng = routeData.distanceTime!.legs![0].endLocation;
    final  polyline = routeData.distanceTime!.polyline;
    emit(LoadedGetRoutesState(
      origin: originLatLng!,
      destination: destLatLng!,
      polyline: polyline!,
    ));
  } catch (e) {
    debugPrint('[GetRoutesBloc] Error: $e');
    emit(ErrorGetRoutesState('Failed to fetch distance and time: \\${e.toString()}'));
  }
}

Future<void> _resetEvent(
  ResetRoutesEvent event,
    Emitter<GetRoutesState> emit,
)async{
  emit(IntialGetRoutesState());
}


