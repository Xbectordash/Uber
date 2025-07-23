import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/homepage/data/create_ride_model.dart';

abstract class CreateRideEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class FetchCreateRideEvent extends CreateRideEvent {
  final CreateRideRequest rideData;

  FetchCreateRideEvent({
    required this.rideData,
  });

  @override
  List<Object?> get props => [
    rideData,
  ];
}