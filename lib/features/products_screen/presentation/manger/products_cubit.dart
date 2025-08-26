import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/model/products/product.dart';
import 'package:ecommerce_app/domain/repos/ProductsRepo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  Future<void> loadProducts(
      {String? subCategory, String? category, String? brand}) async {
    emit(ProductsLoading());
    var result = await productsRepo.getProducts(
        subCategory: subCategory, category: category, brand: brand);
    result.fold((failure) {
      emit(ProductsError(failure.errorMassage));
    }, (products) {
      if (products.isEmpty) {
        emit(ProductsEmpty());
      } else {
        emit(ProductsSuccess(products));
      }
    });
  }

  Future<void> addWashList({required String id}) async {
    emit(AddWashListLoading());
    try {
      var message = await productsRepo.addWashList(id: id);
      message.fold(
        (failure) => emit(AddWashListError(errorMessage: failure.errorMassage)),
        (message) => emit(AddWashListSuccess(message: message)),
      );
    } on Exception catch (e) {
      emit(AddWashListError(errorMessage: e.toString()));
    }
  }

  Future<void> removeWashList({required String id}) async {
    emit(RemoveWahListLoading());
    try {
      var message = await productsRepo.removeWashList(id: id);
      message.fold(
        (failure) =>
            emit(RemoveWahListError(errorMessage: failure.errorMassage)),
        (message) => emit(RemoveWahListSuccess(message: message)),
      );
    } on Exception catch (e) {
      emit(RemoveWahListError(errorMessage: e.toString()));
    }
  }
/*  Future<void> addCart({required String id}) async {
    emit(AddCartLoading());
    try {
      var message = await productsRepo.addCart(id: id);
      message.fold(
            (failure) => emit(AddCartError(errorMessage: failure.errorMassage)),
            (message) => emit(AddCartSuccess(message: message)),
      );
    } on Exception catch (e) {
      emit(AddCartError(errorMessage: e.toString()));
    }
  }*/
}
