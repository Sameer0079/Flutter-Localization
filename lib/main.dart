import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_language/bloc/bloc/app_localizations_bloc.dart';
import 'package:flutter_multi_language/l10n/app_localizations.dart';
import 'package:flutter_multi_language/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppLocalizationsBloc(),
      child: BlocBuilder<AppLocalizationsBloc, AppLocalizationsState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.selectedLanguage.locale,
            title: 'Multi Language',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
