import 'package:flutter/material.dart';
import 'package:poke_app/src/presentation/app/lang/language.dart';

abstract class AppRepository {
  Language get getCurrentLanguage;

  Future<void> savedLanguage(Language language);
}
