import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/cart_model/CartResponse.dart';
import '../../../domain/repos/ProductsRepo/products_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final ProductsRepo productsRepo;
  late CartData _cartData;
  CartCubit(this.productsRepo) : super(AddCartInitial());
  Future<void> addCart({required String id}) async {
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
  }
  Future<void> getCart() async {
    emit(AddCartLoading());
    try {
      var message = await productsRepo.getCart();
      message.fold(
            (failure) => emit(GetCartError(errorMessage: failure.errorMassage)),
            (product) {
              _cartData=product;
              emit(GetCartSuccess(_cartData));
              },
      );
    } on Exception catch (e) {
      emit(AddCartError(errorMessage: e.toString()));
    }
  }
  Future<void> deleteCart({required String id}) async {

    try {
      var message = await productsRepo.deleteCart(id: id);
      message.fold(
            (failure) => emit(DeleteCartError(errorMessage: failure.errorMassage)),
            (cartData) {
              _cartData.cart.removeWhere((element) => element.product.id==id,);
          emit(DeleteCartSuccess(cartResponse: _cartData));
        },
      );
    } on Exception catch (e) {
      emit(DeleteCartError(errorMessage: e.toString()));
    }
  }
  Future<void> putCart({required String id,required int count}) async {

    try {
      var response = await productsRepo.putCart(id: id, count: count);
      response.fold(
            (failure) => emit(PutCartError(errorMessage: failure.errorMassage)),
            (cartData) {

        },
      );
    } on Exception catch (e) {
      emit(PutCartError(errorMessage: e.toString()));
    }
  }

}
