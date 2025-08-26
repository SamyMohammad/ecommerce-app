part of 'brand_cubit.dart';

@immutable
sealed class BrandState {}

final class BrandInitial extends BrandState {}
final class BrandLoading extends BrandState {}
final class BrandSuccess extends BrandState {
  final List<Brand>brand;

  BrandSuccess(this.brand);
}
final class BrandError extends BrandState {
  final String errorMessage;

  BrandError(this.errorMessage);

}

