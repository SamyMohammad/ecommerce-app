import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/main_botton.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:ecommerce_app/core/widget/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s40.h,
                ),
                Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                SizedBox(
                  height: AppSize.s40.h,
                ),
                Text(
                  'Welcome Back To Route',
                  style: getBoldStyle(color: ColorManager.white)
                      .copyWith(fontSize: FontSize.s24.sp),
                ),
                Text(
                  'Please sign in with your mail',
                  style: getRegularStyle(color: ColorManager.white)
                      .copyWith(fontSize: FontSize.s16.sp),
                ),
                SizedBox(
                  height: AppSize.s50.h,
                ),
                BuildTextField(
                  backgroundColor: ColorManager.white,
                  hint: 'enter your name',
                  label: 'user name',
                  textInputType: TextInputType.emailAddress,
                  validation: AppValidators.validateEmail,
                ),
                SizedBox(
                  height: AppSize.s28.h,
                ),
                BuildTextField(
                  hint: 'enter your password',
                  backgroundColor: ColorManager.white,
                  label: 'password',
                  validation: AppValidators.validatePassword,
                  isObscured: true,
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: AppSize.s8.h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          'forget password?',
                          style: getMediumStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s18.sp),
                        )),
                  ],
                ),
                SizedBox(
                  height: AppSize.s60.h,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: MainAppButton(
                      borderRadius: AppSize.s8,
                      backgroundColor: ColorManager.white,
                      text: 'Login',
                      textStyle: getBoldStyle(
                          color: ColorManager.primary, fontSize: AppSize.s20),
                      onTap: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: getMediumStyle(color: ColorManager.white)
                          .copyWith(fontSize: FontSize.s18.sp),
                    ),
                    SizedBox(
                      width: AppSize.s8.w,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, Routes.signUpRoute),
                      child: Text(
                        'Create Account',
                        style: getMediumStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s18.sp),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
