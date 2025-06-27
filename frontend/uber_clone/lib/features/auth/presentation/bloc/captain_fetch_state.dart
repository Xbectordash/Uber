import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/auth/data/captain_model/get_captain.dart';

abstract class CaptainFetchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CaptainFetchInitial extends CaptainFetchState {}

class CaptainFetchLoading extends CaptainFetchState {}

class CaptainFetched extends CaptainFetchState {
  final GetCaptain captainData;
  CaptainFetched(this.captainData);
  @override
  List<Object?> get props => [captainData];
}

class CaptainFetchError extends CaptainFetchState {
  final String message;
  CaptainFetchError(this.message);
  @override
  List<Object?> get props => [message];
}
