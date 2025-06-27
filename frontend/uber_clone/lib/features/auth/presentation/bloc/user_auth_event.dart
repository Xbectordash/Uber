import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/auth/data/user_model/login_user_model.dart';
import 'package:uber_clone/features/auth/data/user_model/signup_user_model.dart';

abstract class UserAuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateUserEvent extends UserAuthEvent {
  final RegisterUserRequest createUser;
  CreateUserEvent({required this.createUser});
  @override
  List<Object?> get props => [createUser];
}

class LoginUserEvent extends UserAuthEvent {
  final LoginUserRequest loginUser;
  LoginUserEvent({required this.loginUser});
  @override
  List<Object?> get props => [loginUser];
}
