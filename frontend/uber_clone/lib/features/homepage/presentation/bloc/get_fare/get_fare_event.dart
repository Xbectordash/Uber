import 'package:equatable/equatable.dart';

abstract class GetFareEvent extends Equatable {
  const GetFareEvent();
}

class FetchFareEvent extends GetFareEvent {
  final String pickup;
  final String destination;

  const FetchFareEvent({required this.pickup, required this.destination});

  @override
  List<Object?> get props => [pickup, destination];
}
