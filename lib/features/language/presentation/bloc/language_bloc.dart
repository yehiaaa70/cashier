import 'package:bloc/bloc.dart';
import 'package:cashir/core/secure_storage/secure_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc(LanguageState languageState) : super(LanguageState.initial()) {
    on<LoadLanguage>((event, emit) {
      emit(LanguageState(locale: event.locale));
    });
  }
}
