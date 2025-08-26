part of 'sign_upcubit_cubit.dart';

@immutable
sealed class SignupCubitState {}

final class SignupCubitInitial extends SignupCubitState {}
final class SignupCubitLoading extends SignupCubitState {}
final class SignupCubitSuccess extends SignupCubitState {
  final AuthResponse authResponse;

  SignupCubitSuccess(this.authResponse);
}
final class SignupCubitError extends SignupCubitState {
  final String errorMessage;

  SignupCubitError( this.errorMessage);
}
