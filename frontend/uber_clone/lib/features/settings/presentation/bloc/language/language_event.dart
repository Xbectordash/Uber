import 'package:equatable/equatable.dart';

abstract class LanguageEvent extends Equatable{
  const LanguageEvent();

  @override
  List<Object?> get props => [];
}

class LoadLanguageEvent extends LanguageEvent{
  final String languageCode;
  const LoadLanguageEvent(  {required this.languageCode});

  @override
  List<Object?> get props => [languageCode];
}


class ChangeLanguageEvent extends LanguageEvent{
  final String languageCode;
  const ChangeLanguageEvent({required this.languageCode});

  @override
  List<Object?> get props => [languageCode];
}
