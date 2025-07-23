import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_clone/features/settings/presentation/bloc/language/language_bloc.dart';
import 'package:uber_clone/features/settings/presentation/bloc/language/language_event.dart';
import 'package:uber_clone/features/settings/presentation/bloc/language/language_state.dart';
import 'package:uber_clone/l10n/app_localizations.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

final List<Map<String, String>> languages = const [
  {'code': 'en', 'label': 'English'},
  {'code': 'hi', 'label': 'हिन्दी'},
  {'code': 'mr', 'label': 'मराठी'},
  {'code': 'gu', 'label': 'ગુજરાતી'},
  {'code': 'ja', 'label': '日本語'},
  {'code': 'ko', 'label': '한국어'},
  {'code': 'zh', 'label': '中文'},
  {'code': 'ar', 'label': 'العربية'},
  {'code': 'ur', 'label': 'اردو'},
  {'code': 'de', 'label': 'Deutsch'},
  {'code': 'fr', 'label': 'Français'},
  {'code': 'es', 'label': 'Español'},
  {'code': 'fa', 'label': 'فارسی'},
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.selectLanguage),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          String currentLangCode = 'en';
          if (state is LanguageLoaded) {
            currentLangCode = state.languageCode;
          }


          return ListView.builder(
            itemCount: languages.length,
            itemBuilder: (context, index) {
              final lang = languages[index];
              final isSelected = currentLangCode == lang['code'];

              return ListTile(
                title: Text(lang['label']!),
                trailing: isSelected
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  context
                      .read<LanguageBloc>()
                      .add(ChangeLanguageEvent(languageCode: lang['code']!));
                  context.pop();
                },
              );
            },
          );
        },
      ),
    );
  }
}
