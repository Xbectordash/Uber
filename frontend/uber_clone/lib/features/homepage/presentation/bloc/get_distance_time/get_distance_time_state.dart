import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/homepage/data/get_distance_time_model.dart';

abstract class GetDistanceTimeState extends Equatable{
  @override
  List<Object?> get props => [];
}

class IntialGetDistanceTimeState extends GetDistanceTimeState {}
class LoadingGetDistanceTimeState extends GetDistanceTimeState {}
class LoadedGetDistanceTimeState extends GetDistanceTimeState {
  DistanceTime distanceTime;

  LoadedGetDistanceTimeState({
    required this.distanceTime,

  });
  @override
  List<Object?> get props => [distanceTime];
}
class ErrorGetDistanceTimeState extends GetDistanceTimeState {
  String message;

  ErrorGetDistanceTimeState(this.message);

  @override
  List<Object?> get props => [message];
}