import 'package:equatable/equatable.dart';

abstract class SuggestionEvent  extends Equatable{
  const SuggestionEvent();
}

class FetchSuggestionsEvent extends SuggestionEvent {
  final String query;

  const FetchSuggestionsEvent(this.query);

  @override
  List<Object> get props => [query];
}

class ResetSuggestionsEvent extends SuggestionEvent {
  @override
  List<Object> get props => [];
}