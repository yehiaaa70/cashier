import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/use_cases/change_language.dart';
import '../../domain/use_cases/save_language.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguagesState> {
  final GetSavedLanguageUseCase getSavedLanguageUseCase;
  final ChangeLanguageUseCase changeLanguageUseCase;

  LanguageCubit(
      {required this.getSavedLanguageUseCase,
        required this.changeLanguageUseCase})
      : super(
     ChangeLocaleState(
      locale: Locale(AppStrings.englishCode),
    ),
  );

  String currentLanguageCode = AppStrings.englishCode;

  Future<void> getSavedLanguage() async {
    final response = await getSavedLanguageUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLanguageCode = value!;
      emit(ChangeLocaleState(locale: Locale(currentLanguageCode)));
    });
  }

  Future<void> _changeLanguage(String languageCode) async {
    final response = await changeLanguageUseCase.call(languageCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLanguageCode = languageCode;
      emit(ChangeLocaleState(locale: Locale(currentLanguageCode)));
    });
  }

  void toEnglish() => _changeLanguage(AppStrings.englishCode);

  void toArabic() => _changeLanguage(AppStrings.arabicCode);
}
