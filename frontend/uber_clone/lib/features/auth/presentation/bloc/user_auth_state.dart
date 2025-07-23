import 'package:equatable/equatable.dart';

abstract class UserAuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserAuthInitial extends UserAuthState {}

class UserAuthLoading extends UserAuthState {}

class UserCreated extends UserAuthState {}

class UserLoggedIn extends UserAuthState {}

class UserAuthError extends UserAuthState {
  final String message;
  UserAuthError(this.message);
  @override
  List<Object?> get props => [message];
}
