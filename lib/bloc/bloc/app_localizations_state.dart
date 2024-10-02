part of 'app_localizations_bloc.dart';

class AppLocalizationsState extends Equatable {
  final Language selectedLanguage;
  const AppLocalizationsState({Language? language})
      : selectedLanguage = language ?? Language.english;

  @override
  List<Object> get props => [selectedLanguage];

  AppLocalizationsState copyWith({Language? selectedLanguage}) {
    return AppLocalizationsState(
        language: selectedLanguage ?? this.selectedLanguage);
  }
}
