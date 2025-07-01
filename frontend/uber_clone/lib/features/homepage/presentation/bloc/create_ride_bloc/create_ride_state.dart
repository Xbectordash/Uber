import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/homepage/data/create_ride_model.dart';

abstract class CreateRideState extends Equatable{
  @override
  List<Object?> get props => [];
} 

class CreateRideInitialState extends CreateRideState {}
class CreateRideLoadingState extends CreateRideState {}
class CreateRideSuccessState extends CreateRideState {
  final Ride ride;
  CreateRideSuccessState({
    required this.ride,
  });
  @override
  List<Object?> get props => [
    ride,
  ];
}
class CreateRideErrorState extends CreateRideState {
  final String errorMessage;
  CreateRideErrorState({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [
    errorMessage,
  ];
}