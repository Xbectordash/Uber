import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/auth/data/captain_model/login_captain_model.dart';
import 'package:uber_clone/features/auth/data/captain_model/signup_captain_model.dart';

abstract class CaptainAuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateCaptainEvent extends CaptainAuthEvent {
  final CaptainRegisterRequest createCaptain;
  CreateCaptainEvent({required this.createCaptain});
  @override
  List<Object?> get props => [createCaptain];
}

class LoginCaptainEvent extends CaptainAuthEvent {
  final CaptainLoginRequest loginCaptain;
  LoginCaptainEvent({required this.loginCaptain});
  @override
  List<Object?> get props => [loginCaptain];
}
