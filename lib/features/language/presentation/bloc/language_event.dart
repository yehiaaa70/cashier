part of 'language_bloc.dart';

abstract class LanguageEvent {
  const LanguageEvent();
}

class LoadLanguage extends LanguageEvent {
  final Locale locale;
  LoadLanguage({
    required this.locale,
  });
}
class ChangeLocaleState extends LanguageEvent {
  final Locale locale;
  ChangeLocaleState({
    required this.locale,
  });
}
