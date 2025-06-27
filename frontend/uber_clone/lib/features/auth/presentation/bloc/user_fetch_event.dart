import 'package:equatable/equatable.dart';

abstract class UserFetchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserEvent extends UserFetchEvent {}
