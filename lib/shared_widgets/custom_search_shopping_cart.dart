import 'package:e_commerce/Domain_Layer/dependency_injection.dart';
import 'package:e_commerce/Ui_Layer/Cart/Cubit/cart_item_states.dart';
import 'package:e_commerce/Ui_Layer/Cart/cart_items_screen.dart';
import 'package:e_commerce/Ui_Layer/Tabs/Home_Tab/widgets/search_text_field.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_assets.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Cart/Cubit/cart_items_screen_view_model.dart';

class CustomSearchWithShoppingCart extends StatelessWidget {
  final String? cartItem;

  CustomSearchWithShoppingCart({this.cartItem, super.key});

  CartItemsScreenViewModel? viewModel = CartItemsScreenViewModel(
      getCartUseCase: injectGetCartUseCase(),
      deleteCartItemUseCase: injectDeleteCartItemUseCase(),
      updateCartItemUseCase: injectUpdateCartItemUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemsScreenViewModel, CartStates>(
      bloc: viewModel!..getCartResponse(),
      builder: (context, state) {
        return SizedBox(
          height: 50.h,
          child: Row(
            children: [
              Expanded(
                  child: SearchTextField(
                onTap: null,
              )),
              SizedBox(width: 24.w),
              state is CartLoadingState
                  ? const CircularProgressIndicator(
                      color: MyColors.primaryColor,
                    )
                  : InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(CartItemsScreen.routeName);
                      },
                      child: Badge(
                        alignment: AlignmentDirectional.topStart,
                        backgroundColor: MyColors.greenColor,
                        label: Text(viewModel!
                                .cartProducts.data?.products?.length
                                .toString() ??
                            "0"),
                        child: ImageIcon(
                          const AssetImage(MyAssets.shoppingCart),
                          size: 28.sp,
                          color: MyColors.primaryColor,
                        ),
                      ))
            ],
          ),
        );
      },
    );
  }
}
