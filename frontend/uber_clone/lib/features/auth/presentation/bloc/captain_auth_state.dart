import 'package:equatable/equatable.dart';

abstract class CaptainAuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CaptainAuthInitial extends CaptainAuthState {}

class CaptainAuthLoading extends CaptainAuthState {}

class CaptainCreated extends CaptainAuthState {}

class CaptainLoggedIn extends CaptainAuthState {}

class CaptainAuthError extends CaptainAuthState {
  final String message;
  CaptainAuthError(this.message);
  @override
  List<Object?> get props => [message];
}
