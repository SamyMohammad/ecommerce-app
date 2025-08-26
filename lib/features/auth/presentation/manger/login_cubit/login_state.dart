part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {
  final AuthResponse authResponse;

  LoginSuccess( this.authResponse);
}
final class LoginError extends LoginState {
  final String errorMessage;

  LoginError( this.errorMessage);
}
