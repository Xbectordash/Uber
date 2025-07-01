import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/homepage/data/get_fare_model.dart';

abstract class GetFareState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialGetFareState extends GetFareState {}
class LoadingGetFareState extends GetFareState {}
class LoadedGetFareState extends GetFareState {
  final GetFare fare;
  LoadedGetFareState({required this.fare});
  @override
  List<Object?> get props => [fare];
}
class ErrorGetFareState extends GetFareState {
  final String message;
  ErrorGetFareState(this.message);
  @override
  List<Object?> get props => [message];
}
