import 'package:equatable/equatable.dart';

abstract class CaptainFetchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCaptainEvent extends CaptainFetchEvent {}
