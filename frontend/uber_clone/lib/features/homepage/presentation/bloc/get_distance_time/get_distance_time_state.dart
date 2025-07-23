import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/homepage/data/get_distance_time_model.dart';

abstract class GetDistanceTimeState extends Equatable{
  @override
  List<Object?> get props => [];
}

class IntialGetDistanceTimeState extends GetDistanceTimeState {}
class LoadingGetDistanceTimeState extends GetDistanceTimeState {}
class LoadedGetDistanceTimeState extends GetDistanceTimeState {
  final String origin;
  final String destination;
  final DistanceTime distanceTime;

  LoadedGetDistanceTimeState({
    required this.origin,
    required this.destination,
    required this.distanceTime,
  });

  @override
  List<Object?> get props => [origin, destination, distanceTime];
}
class ErrorGetDistanceTimeState extends GetDistanceTimeState {
  final String message;

  ErrorGetDistanceTimeState(this.message);

  @override
  List<Object?> get props => [message];
}