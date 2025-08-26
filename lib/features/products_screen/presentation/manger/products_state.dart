part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class ProductsEmpty extends ProductsState {}
final class ProductsLoading extends ProductsState {}
final class ProductsSuccess extends ProductsState {
  final List<Product>product;

  ProductsSuccess(this.product);
}
final class ProductsError extends ProductsState {
  final String errorMessage;

  ProductsError(this.errorMessage);
}


final class AddWashListLoading extends ProductsState {}
final class AddWashListSuccess extends ProductsState {
  final String message;

  AddWashListSuccess({required this.message});


}
final class AddWashListError extends ProductsState {
  final String errorMessage;

  AddWashListError({required this.errorMessage});


}

final class RemoveWahListLoading extends ProductsState {}
final class RemoveWahListSuccess extends ProductsState {
  final String message;

 RemoveWahListSuccess({required this.message});


}
final class RemoveWahListError extends ProductsState {
  final String errorMessage;

  RemoveWahListError({required this.errorMessage});


}

// final class AddCartLoading extends ProductsState {}
// final class AddCartSuccess extends ProductsState {
//   final String message;
//
//   AddCartSuccess({required this.message});
//
//
// }
// final class AddCartError extends ProductsState {
//   final String errorMessage;
//
//   AddCartError({required this.errorMessage});
//
//
// }
