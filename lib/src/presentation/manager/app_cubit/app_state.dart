part of 'app_cubit.dart';

class AppState {
  const AppState({required this.locale});

  factory AppState.initial(AppRepository _appPreferencesRepository) {
    final language = _appPreferencesRepository.getCurrentLanguage;

    return AppState(
      locale: language.locale,
    );
  }

  //Set the language of the app
  final Locale? locale;

  @override
  List<Object?> get props => [locale];

  AppState copyWith({Locale? locale, bool? welcomeScreenWasShow}) {
    return AppState(
      locale: locale ?? this.locale,
    );
  }
}
