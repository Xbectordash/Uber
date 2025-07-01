import 'package:equatable/equatable.dart';

abstract class GetDistanceTimeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDistanceTimeEvent extends GetDistanceTimeEvent {
  final String origin;
  final String destination;

  FetchDistanceTimeEvent({
    required this.origin,
    required this.destination,
  });

  @override
  List<Object?> get props => [origin, destination];
}