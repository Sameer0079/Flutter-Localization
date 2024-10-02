import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_multi_language/enums/language_enum.dart';

part 'app_localizations_event.dart';
part 'app_localizations_state.dart';

class AppLocalizationsBloc
    extends Bloc<AppLocalizationsEvent, AppLocalizationsState> {
  AppLocalizationsBloc() : super(const AppLocalizationsState()) {
    on<ChangeAppLocalizations>(changeLanguage);
  }

  void changeLanguage(
      ChangeAppLocalizations event, Emitter<AppLocalizationsState> emit) {
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }
}
