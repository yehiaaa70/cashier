part of 'language_cubit.dart';

@immutable
abstract class LanguagesState extends Equatable {
  final Locale locale;

  const LanguagesState({required this.locale});
  @override
  List<Object> get props => [locale];
}

class ChangeLocaleState extends LanguagesState {
  ChangeLocaleState({required super.locale});


}
