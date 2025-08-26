// import 'package:ecommerce_app/core/resources/assets_manager.dart';
// import 'package:ecommerce_app/core/resources/color_manager.dart';
// import 'package:ecommerce_app/core/resources/values_manager.dart';
// import 'package:ecommerce_app/core/routes_manager/routes.dart';
// import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
// import 'package:ecommerce_app/core/widget/main_text_field.dart';
// import 'package:ecommerce_app/core/widget/validators.dart';
// import 'package:ecommerce_app/data/model/auth_model/login_request/LoginRequest.dart';
// import 'package:ecommerce_app/features/auth/presentation/manger/login_cubit/login_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';
//
// import '../../../../core/resources/font_manager.dart';
// import '../../../../core/resources/styles_manager.dart';
//
// class SignInScreen extends StatefulWidget {
//   const SignInScreen({
//     super.key,
//   });
//
//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LoginCubit, LoginState>(
//       listener: (context, state) {
//         if (state is LoginSuccess) {
//           Navigator.of(context).pop(); // Close loading dialog
//           showTopSnackBar(
//             Overlay.of(context),
//             const CustomSnackBar.success(
//               message: "Login successful!",
//             ),
//           );
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             Routes.mainRoute,
//             (route) => false,
//           );
//         } else if (state is LoginLoading) {
//           showDialog(context: context, builder: (context) {
//             return const AlertDialog(
//               elevation: 0,
//               backgroundColor: Colors.transparent,
//               title: Center(child: CircularProgressIndicator(),),
//             );
//           },);
//         } else if (state is LoginError) {
//           Navigator.of(context).pop();  // Close loading dialog
//           showTopSnackBar(
//             Overlay.of(context),
//             CustomSnackBar.error(
//               message: state.errorMessage,
//             ),
//           );
//         }
//       },
//       child: Scaffold(
//         backgroundColor: ColorManager.primary,
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(AppPadding.p20),
//             child: Form(
//               key: _formKey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: AppSize.s40.h,
//                     ),
//                     Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
//                     SizedBox(
//                       height: AppSize.s40.h,
//                     ),
//                     Text(
//                       'Welcome Back To Route',
//                       style: getBoldStyle(color: ColorManager.white)
//                           .copyWith(fontSize: FontSize.s24.sp),
//                     ),
//                     Text(
//                       'Please sign in with your mail',
//                       style: getLightStyle(color: ColorManager.white)
//                           .copyWith(fontSize: FontSize.s16.sp),
//                     ),
//                     SizedBox(
//                       height: AppSize.s50.h,
//                     ),
//                     BuildTextField(
//                       controller: _emailController,
//                       backgroundColor: ColorManager.white,
//                       hint: 'enter your name',
//                       label: 'User name',
//                       textInputType: TextInputType.emailAddress,
//                       validation: AppValidators.validateEmail,
//                     ),
//                     SizedBox(
//                       height: AppSize.s28.h,
//                     ),
//                     BuildTextField(
//                       controller: _passwordController,
//                       hint: 'enter your password',
//                       backgroundColor: ColorManager.white,
//                       label: 'Password',
//                       validation: AppValidators.validatePassword,
//                       isObscured: true,
//                       textInputType: TextInputType.text,
//                     ),
//                     SizedBox(
//                       height: AppSize.s8.h,
//                     ),
//                     Row(
//                       children: [
//                         const Spacer(),
//                         GestureDetector(
//                             onTap: () {},
//                             child: Text(
//                               'Forget password?',
//                               style: getMediumStyle(color: ColorManager.white)
//                                   .copyWith(fontSize: FontSize.s18.sp),
//                             )),
//                       ],
//                     ),
//                     SizedBox(
//                       height: AppSize.s60.h,
//                     ),
//                     Center(
//                       child: SizedBox(
//                         // width: MediaQuery.of(context).size.width * .8,
//                         child: CustomElevatedButton(
//                           // borderRadius: AppSize.s8,
//                           isStadiumBorder: false,
//                           label: 'Login',
//                           backgroundColor: ColorManager.white,
//                           textStyle: getBoldStyle(
//                               color: ColorManager.primary,
//                               fontSize: AppSize.s18),
//                           onTap: () {
//                             if (_formKey.currentState!.validate()) {
//                               context.read<LoginCubit>().login(LoginRequest(
//                                   email: _emailController.text,
//                                   password: _passwordController.text));
//                             }
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30.h,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Don’t have an account?',
//                           style: getSemiBoldStyle(color: ColorManager.white)
//                               .copyWith(fontSize: FontSize.s16.sp),
//                         ),
//                         SizedBox(
//                           width: AppSize.s8.w,
//                         ),
//                         GestureDetector(
//                           onTap: () =>
//                               Navigator.pushNamed(context, Routes.signUpRoute),
//                           child: Text(
//                             'Create Account',
//                             style: getSemiBoldStyle(color: ColorManager.white)
//                                 .copyWith(fontSize: FontSize.s16.sp),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:ecommerce_app/core/widget/validators.dart';
import 'package:ecommerce_app/data/model/auth_model/login_request/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context).pop(); // Close loading dialog
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(
              message: "Login successful!",
            ),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.mainRoute,
                (route) => false,
          );
        } else if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Center(child: CircularProgressIndicator()),
              );
            },
          );
        } else if (state is LoginError) {
          Navigator.of(context).pop(); // Close loading dialog
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: state.errorMessage,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary, // خلفية الشاشة بالكامل
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSize.s40.h),
                   // Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                    SizedBox(height: AppSize.s40.h),
                    Text(
                      'Welcome Back ',
                      style: getBoldStyle(color: ColorManager.white)
                          .copyWith(fontSize: FontSize.s24.sp),
                    ),
                    Text(
                      'Please sign in with your mail',
                      style: getLightStyle(color: ColorManager.white)
                          .copyWith(fontSize: FontSize.s16.sp),
                    ),
                    SizedBox(height: AppSize.s50.h),

                    // ===== TextFields With Background Container =====
                    Container(
                      padding: EdgeInsets.all(AppPadding.p12.w),
                      decoration: BoxDecoration(
                        color: ColorManager.containerGray.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(AppSize.s12.r),
                      ),
                      child: Column(
                        children: [
                          BuildTextField(
                            controller: _emailController,
                            backgroundColor: ColorManager.white,

                            hint: 'Enter your email',
                            hintTextStyle: TextStyle(color: ColorManager.primary),
                            label: 'Email',
                            textInputType: TextInputType.emailAddress,
                            validation: AppValidators.validateEmail,
                          ),
                          SizedBox(height: AppSize.s20.h),
                          BuildTextField(
                            controller: _passwordController,
                            hint: 'Enter your password',
                            hintTextStyle: TextStyle(color: ColorManager.primary),
                            backgroundColor: ColorManager.white,
                            label: 'Password',
                            validation: AppValidators.validatePassword,
                            isObscured: true,
                            textInputType: TextInputType.text,
                          ),
                          SizedBox(height: AppSize.s8.h),
                          Row(
                            children: [
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Forget password?',
                                  style: getMediumStyle(
                                      color: ColorManager.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppSize.s60.h),

                    // ===== Login Button =====
                    Center(
                      child: SizedBox(
                        child: CustomElevatedButton(
                          isStadiumBorder: true,
                          label: 'Login',
                          backgroundColor: ColorManager.darkPrimary,
                          textStyle: getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s20.sp,
                          ),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginCubit>().login(LoginRequest(
                                  email: _emailController.text,
                                  password: _passwordController.text));
                            }
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),

                    // ===== Don't have account =====
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: getSemiBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                        SizedBox(width: AppSize.s8.w),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.signUpRoute),
                          child: Text(
                            'Create Account',
                            style: getSemiBoldStyle(
                                color: ColorManager.darkPrimary)
                                .copyWith(fontSize: FontSize.s16.sp),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

