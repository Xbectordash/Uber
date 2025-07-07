import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StartRideEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartRideRequested extends StartRideEvent {
  final String rideId;
  final String otp;

  StartRideRequested({required this.rideId, required this.otp});

  @override
  List<Object?> get props => [rideId, otp];
}
