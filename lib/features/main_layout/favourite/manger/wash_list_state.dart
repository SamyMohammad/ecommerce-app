part of 'wash_list_cubit.dart';

@immutable
sealed class WashListState {}

final class WashListInitial extends WashListState {}
final class WashListSuccess extends WashListState {
  final List<Product> product;
  final List<String> wishlistIds;

  WashListSuccess(this.product, this.wishlistIds);
}
final class WashListLoading extends WashListState {}
final class WashListError extends WashListState {
  final String errorMessage;

  WashListError(this.errorMessage);
}
