import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/homepage/data/get_suggestion_model.dart';

abstract class SuggestionState extends Equatable{
    @override
  List<Object> get props => [];

}

class SuggestionInitialState extends SuggestionState {
  
}
class SuggestionLoadingState extends SuggestionState {
  @override
  List<Object> get props => [];
}
class SuggestionLoadedState extends SuggestionState {
  final List<Suggestions> suggestions;
  SuggestionLoadedState(this.suggestions);
  @override
  List<Object> get props => [suggestions];
}
class SuggestionEmptyState extends SuggestionState {
  @override
  List<Object> get props => [];
}
class SuggestionErrorState extends SuggestionState {
  final String error;
  SuggestionErrorState(this.error);
  @override
  List<Object> get props => [error];
}