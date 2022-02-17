/* 
import 'package:equatable/equatable.dart'; */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/src/domain/repositories/app_repository.dart';
import 'package:poke_app/src/presentation/app/lang/language.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this._appPreferencesRepository)
      : super(AppState.initial(_appPreferencesRepository));

  final AppRepository _appPreferencesRepository;

  Future<void> changeLanguage(Language language) async {
    emit(state.copyWith(locale: language.locale));
    await _appPreferencesRepository.savedLanguage(language);
  }
}
