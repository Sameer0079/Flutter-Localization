part of 'app_localizations_bloc.dart';

sealed class AppLocalizationsEvent extends Equatable {
  const AppLocalizationsEvent();

  @override
  List<Object> get props => [];
}

class ChangeAppLocalizations extends AppLocalizationsEvent {
  final Language selectedLanguage;

  const ChangeAppLocalizations({required this.selectedLanguage});
}

class GetLanguage extends AppLocalizationsEvent {}
