import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uber_clone/features/settings/presentation/bloc/language/language_event.dart';
import 'package:uber_clone/features/settings/presentation/bloc/language/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState>{
  final FlutterSecureStorage _storage;

  LanguageBloc(this._storage) : super(LanguageInitial()) {
    on<ChangeLanguageEvent>(_onChangeLanguage);
    on<LoadLanguageEvent>(_onLoadLanguage);
  }

  Future<void> _onChangeLanguage(
    ChangeLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    await _storage.write(key: 'languageCode', value: event.languageCode);
    emit(LanguageLoaded(languageCode: event.languageCode));
  }

  Future<void> _onLoadLanguage(
    LoadLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    final languageCode = await _storage.read(key: 'languageCode') ?? 'en';
    final supportedLocales = [
    'en', 'hi', 'mr', 'gu', 'ja', 'ko', 'zh',
    'ar', 'ur', 'de', 'fr', 'es', 'fa' // <-- notice: sa removed
  ];

    final langCode = supportedLocales.contains(languageCode) ? languageCode : 'en';
    emit(LanguageLoaded(languageCode: langCode));
  }
}