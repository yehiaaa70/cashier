part of 'login_cubit.dart';

abstract class LoginState extends Equatable {

  const LoginState();

  @override
  List<Object> get props => [];
}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class LoadedLoginState extends LoginState {}

class AuthStateAuthenticated extends LoginState {}

class AuthStateLogout extends LoginState {}

class ChangeLocaleState extends LoginState {
  final Locale locale;

  const ChangeLocaleState({required this.locale});
  @override
  List<Object> get props => [locale];

}

class GetTokenLoading extends LoginState {}
class GetTokenLoaded extends LoginState {}
class GetTokenEmpty extends LoginState {}
