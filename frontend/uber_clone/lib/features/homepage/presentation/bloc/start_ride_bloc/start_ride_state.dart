import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StartRideState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartRideInitial extends StartRideState {}
class StartRideLoading extends StartRideState {}
class StartRideSuccess extends StartRideState {}
class StartRideFailure extends StartRideState {
  final String error;
  StartRideFailure(this.error);

  @override
  List<Object?> get props => [error];
}
