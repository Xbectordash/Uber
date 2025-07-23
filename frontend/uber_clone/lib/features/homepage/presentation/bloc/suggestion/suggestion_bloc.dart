import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/homepage/data/get_suggestion_model.dart';
import 'package:uber_clone/features/homepage/domain/get_suggestion_repo.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/suggestion/suggestion_event.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/suggestion/suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent,SuggestionState>{
  SuggestionBloc():super (SuggestionInitialState()){
    on<FetchSuggestionsEvent>(_onFetchSuggestions);
    on<ResetSuggestionsEvent>((event, emit) => emit(SuggestionInitialState()));
  }
}

Future<void> _onFetchSuggestions(
  FetchSuggestionsEvent event,
  Emitter<SuggestionState> emit,
) async{
  try{
    emit(SuggestionLoadingState());
    debugPrint('Suggestion api called');
    final GetSuggestion response = await GetSuggestionRepo().getSuggestion(event.query);
    debugPrint('[SuggestionBloc] Fetched suggestions: ${response.suggestions?.length ?? 0}');
    if (response.suggestions == null || response.suggestions!.isEmpty) {
      emit(SuggestionEmptyState());
      return;
    }
    final List<Suggestions> suggestions = response.suggestions?? [];
    debugPrint('[SuggestionBloc] Suggestions: ${suggestions.length}');
    emit(SuggestionLoadedState(response.suggestions?? []));

  }
  catch(e){
    emit(SuggestionErrorState(e.toString()));
  }
}