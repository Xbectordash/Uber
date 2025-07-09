import 'package:equatable/equatable.dart';

abstract class GetRouteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchRoutesEvent extends GetRouteEvent {
  final String origin;
  final String destination;

  FetchRoutesEvent({required this.origin, required this.destination});

  @override
  List<Object?> get props => [origin, destination];
}

class ResetRoutesEvent extends GetRouteEvent {
  @override
  List<Object?> get props => [];
}
