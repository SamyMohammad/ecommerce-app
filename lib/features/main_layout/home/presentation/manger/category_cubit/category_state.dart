part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
final class CategorySuccess extends CategoryState {
  final List<Category>category;

  CategorySuccess(this.category);

}
final class CategoryError extends CategoryState {
  final String errorMessage;

  CategoryError(this.errorMessage);
}
