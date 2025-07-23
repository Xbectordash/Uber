import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/homepage/data/get_distance_time_model.dart';
import 'package:uber_clone/features/homepage/data/get_routes_model.dart';

abstract class GetRoutesState extends Equatable{
  @override
  List<Object?> get props => [];
}

class IntialGetRoutesState extends GetRoutesState {}
class LoadingGetRoutesState extends GetRoutesState {}
class LoadedGetRoutesState extends GetRoutesState {
  final Northeast origin;
  final Northeast destination;
  final String polyline;

  LoadedGetRoutesState({
    required this.origin,
    required this.destination,
    required this.polyline,
  });

  @override
  List<Object?> get props => [origin, destination, polyline];
}
class ErrorGetRoutesState extends GetRoutesState {
  final String message;

  ErrorGetRoutesState(this.message);

  @override
  List<Object?> get props => [message];
}