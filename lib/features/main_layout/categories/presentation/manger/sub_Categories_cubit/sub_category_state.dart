part of 'sub_category_cubit.dart';

@immutable
sealed class SubCategoryState {}

final class SubCategoryInitial extends SubCategoryState {}
final class SubCategoryLoading extends SubCategoryState {}
final class SubCategoryEmpty extends SubCategoryState {}
final class SubCategorySuccess extends SubCategoryState {
 final List<SubCategory>subCategory;

  SubCategorySuccess(this.subCategory);
}
final class SubCategoryError extends SubCategoryState {
  final String errorMessage;

  SubCategoryError(this.errorMessage);
}
