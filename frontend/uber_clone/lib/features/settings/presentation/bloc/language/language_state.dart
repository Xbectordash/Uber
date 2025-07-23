import 'package:equatable/equatable.dart';

abstract class LanguageState extends Equatable{
  const LanguageState();

  @override
  List<Object?> get props => [];
}

class LanguageInitial extends LanguageState{
  const LanguageInitial();
}

class LanguageLoaded extends LanguageState{
  final String languageCode;
  const LanguageLoaded({required this.languageCode});

  @override
  List<Object?> get props => [languageCode];
}

class LanguageError extends LanguageState{
  final String message;
  const LanguageError({required this.message});

  @override
  List<Object?> get props => [message];
}

