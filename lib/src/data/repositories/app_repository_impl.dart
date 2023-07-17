import 'package:flutter/foundation.dart';
import 'package:poke_app/src/domain/repositories/app_repository.dart';
import 'package:poke_app/src/presentation/app/lang/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRepositoryImpl implements AppRepository {
  AppRepositoryImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const _keyLocale = 'app_preferences_locale';
  final keyWelcomeScreen = 'app_preferences_welcome_screen';

  @override
  Language get getCurrentLanguage {
    // String? srtLanguage = await _cacheStorage.read<String>(keyLocale);
    final String? srtLanguage = _sharedPreferences.getString(_keyLocale);

    if (srtLanguage != null) {
      return Language.values.firstWhere(
        (element) => element.toString() == 'Language.$srtLanguage',
      );
    } else {
      return Language.es;
    }
  }

  @override
  Future<void> savedLanguage(Language language) async {
    // await _cacheStorage.write<String>(keyLocale, describeEnum(language));
    await _sharedPreferences.setString(_keyLocale, describeEnum(language));
  }
}
