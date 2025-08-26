import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/model/products/product.dart';
import 'package:ecommerce_app/domain/repos/WahListRepo/wash_list_repo.dart';
import 'package:meta/meta.dart';

part 'wash_list_state.dart';

class WashListCubit extends Cubit<WashListState> {
  final WashListRepo washListRepo;
  List<String> wishlistIds = [];
  WashListCubit(this.washListRepo) : super(WashListInitial());

  Future<void>getWashList()async {
    emit(WashListLoading());
    try {



      var result = await washListRepo.getWashList();
      result.fold(
            (failure) => emit(WashListError( failure.errorMassage)),
          (product){
            wishlistIds = product.map((e) => e.id).whereType<String>().toList();
            print("id:::::$wishlistIds");
            emit(WashListSuccess(product, wishlistIds));
          }

      );
    } on Exception catch (e) {
      emit(WashListError(e.toString()));
    }


  }
  bool isInWishlist(String productId) {
    return wishlistIds.contains(productId);

  }
}
