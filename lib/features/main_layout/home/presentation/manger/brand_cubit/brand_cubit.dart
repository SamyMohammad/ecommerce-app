import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/model/brand_model/Brand.dart';
import 'package:ecommerce_app/domain/repos/HomeRepo/home_repo.dart';
import 'package:meta/meta.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandCubit(this.homeRepo) : super(BrandInitial());
  final HomeRepo homeRepo;
  Future<void>loadBrand()async{
    emit(BrandLoading());
   var result=await homeRepo.getBrands();
   print("resultttttttttt${result.toString()}");
   result.fold((failure){
     print("❌ Failed to get categories: ${failure.errorMassage}");
     emit(BrandError(failure.errorMassage));
   }, (brand){
     print("✅ Categories fetched successfully: ${brand.length}");
     emit(BrandSuccess(brand));

   });

  }
}
