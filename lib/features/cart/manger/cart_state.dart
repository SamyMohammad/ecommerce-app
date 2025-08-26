part of 'cart_cubit.dart';

@immutable
sealed class CartState {}
final class AddCartInitial extends CartState {}
final class AddCartLoading extends CartState {}
final class AddCartSuccess extends CartState {
  final String message;

  AddCartSuccess({required this.message});


}
final class AddCartError extends CartState {
  final String errorMessage;

  AddCartError({required this.errorMessage});


}
final class GetCartInitial extends CartState {}
final class GetCartLoading extends CartState {}
final class GetCartSuccess extends CartState {
  final CartData cartResponse;
  GetCartSuccess(this.cartResponse);


}
final class GetCartError extends CartState {
  final String errorMessage;

  GetCartError({required this.errorMessage});


}
final class DeleteCartLoading extends CartState {}
final class DeleteCartSuccess extends CartState {
  final CartData cartResponse;

  DeleteCartSuccess({required this.cartResponse});


}
final class DeleteCartError extends CartState {
  final String errorMessage;

  DeleteCartError({required this.errorMessage});


}
final class PutCartLoading extends CartState {}
final class PutCartSuccess extends CartState {
  final CartData cartResponse;

  PutCartSuccess({required this.cartResponse});


}
final class PutCartError extends CartState {
  final String errorMessage;

  PutCartError({required this.errorMessage});


}