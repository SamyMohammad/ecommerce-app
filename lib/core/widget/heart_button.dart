import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/manger/wash_list_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/manger/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HeartButton extends StatelessWidget {
   HeartButton({super.key, required this.id});

  final String id;

  String heartIcon = IconsAssets.icHeart;

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsCubit>(),
      child: BlocConsumer<ProductsCubit, ProductsState >(
        listener: (context, state) {
          if(state is RemoveWahListSuccess){

            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                message:state.message ,
              ),
            );
            context.read<WashListCubit>().getWashList();
          }
          if(state is AddWashListSuccess){

            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                message:state.message ,
              ),
            );
          }
        // else  if(state is AddWashListError){
        //
        //     showTopSnackBar(
        //       Overlay.of(context),
        //       CustomSnackBar.success(
        //         message:state.errorMessage ,
        //       ),
        //     );
         // }

        },
        builder: (context, state) {


          return InkWell(
            // radius: 25,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onTap: () {


              if(isClicked){
                context.read<ProductsCubit>().removeWashList(id: id);
              }else{
                context.read<ProductsCubit>().addWashList(id: id);
              }




                isClicked = !isClicked;
                heartIcon =
                !isClicked ? IconsAssets.icHeart : IconsAssets.icClickedHeart;

            },
            child: Material(
              // borderRadius: BorderRadius.circular(2),
              color: ColorManager.white,
              elevation: 5,
              shape: const StadiumBorder(),
              shadowColor: ColorManager.black,
              child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: ImageIcon(

                    AssetImage(heartIcon),
                    color: ColorManager.primary,
                  )),
            ),
          );
        },
      ),
    );
  }
}
