import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/auth/data/user_model/get_user.dart';

abstract class UserFetchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserFetchInitial extends UserFetchState {}

class UserFetchLoading extends UserFetchState {}

class UserFetched extends UserFetchState {
  final GetUser userData;
  UserFetched(this.userData);
  @override
  List<Object?> get props => [userData];
}

class UserFetchError extends UserFetchState {
  final String message;
  UserFetchError(this.message);
  @override
  List<Object?> get props => [message];
}
