// import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
// import 'package:ecommerce_app/data/model/auth_model/signup_model/SignUpRequest.dart';
// import 'package:ecommerce_app/features/auth/presentation/manger/signUp_cubit/sign_upcubit_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';
//
// import '../../../../core/resources/assets_manager.dart';
// import '../../../../core/resources/color_manager.dart';
// import '../../../../core/resources/styles_manager.dart';
// import '../../../../core/resources/values_manager.dart';
// import '../../../../core/routes_manager/routes.dart';
// import '../../../../core/widget/main_text_field.dart';
// import '../../../../core/widget/validators.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController _nameController=TextEditingController();
//   final TextEditingController _numberController=TextEditingController();
//   final TextEditingController _emailController=TextEditingController();
//   final TextEditingController _passwordController=TextEditingController();
//   final TextEditingController _RepasswordController=TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<SignupCubit, SignupCubitState>(
//       listener: (context, state) {
//         if (state is SignupCubitSuccess) {
//           Navigator.of(context).pop(); // Close loading dialog
//           showTopSnackBar(
//             Overlay.of(context),
//             const CustomSnackBar.success(
//               message: "signUP successful!",
//             ),
//           );
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             Routes.signInRoute,
//                 (route) => false,
//           );
//         } else if (state is SignupCubitLoading) {
//          showDialog(context: context, builder: (context) {
//            return const AlertDialog(
//              elevation: 0,
//              backgroundColor: Colors.transparent,
//              title: Center(child: CircularProgressIndicator(),),
//            );
//          },);
//         } else if (state is SignupCubitError) {
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
//             child: SingleChildScrollView(
//               child: Form(
//                 key: _formKey,
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
//                     BuildTextField(
//                       controller: _nameController,
//                       backgroundColor: ColorManager.white,
//                       hint: 'enter your full name',
//                       label: 'Full Name',
//                       textInputType: TextInputType.name,
//                       validation: AppValidators.validateFullName,
//                     ),
//                     SizedBox(
//                       height: AppSize.s18.h,
//                     ),
//                     BuildTextField(
//                       controller: _numberController,
//                       hint: 'enter your mobile no.',
//                       backgroundColor: ColorManager.white,
//                       label: 'Mobile Number',
//                       validation: AppValidators.validatePhoneNumber,
//                       textInputType: TextInputType.phone,
//                     ),
//                     SizedBox(
//                       height: AppSize.s18.h,
//                     ),
//                     BuildTextField(
//                       controller: _emailController,
//                       hint: 'enter your email address',
//                       backgroundColor: ColorManager.white,
//                       label: 'E-mail address',
//                       validation: AppValidators.validateEmail,
//                       textInputType: TextInputType.emailAddress,
//                     ),
//                     SizedBox(
//                       height: AppSize.s18.h,
//                     ),
//                     BuildTextField(
//                       controller: _passwordController,
//                       hint: 'enter your password',
//                       backgroundColor: ColorManager.white,
//                       label: 'password',
//                       validation: AppValidators.validatePassword,
//                       isObscured: true,
//                       textInputType: TextInputType.text,
//                     ),
//                     SizedBox(
//                       height: AppSize.s50.h,
//                     ),
//                     Center(
//                       child: SizedBox(
//                         height: AppSize.s60.h,
//                         width: MediaQuery
//                             .of(context)
//                             .size
//                             .width * .9,
//                         child: CustomElevatedButton(
//                           // borderRadius: AppSize.s8,
//                           label: 'Sign Up',
//                           backgroundColor: ColorManager.white,
//                           textStyle: getBoldStyle(
//                               color: ColorManager.primary, fontSize: AppSize.s20),
//                           onTap: () {
//                             if(_formKey.currentState!.validate()){
//                               context.read<SignupCubit>().signUp(SignUpRequest(
//                                 password: _passwordController.text,
//                                 email: _emailController.text,
//                                 name: _nameController.text,
//                                 phone: _numberController.text,
//                                 rePassword: _passwordController.text,
//
//                               ));
//                             }
//                           },
//                         ),
//                       ),
//                     ),
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
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/data/model/auth_model/signup_model/SignUpRequest.dart';
import 'package:ecommerce_app/features/auth/presentation/manger/signUp_cubit/sign_upcubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _RepasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupCubitState>(
      listener: (context, state) {
        if (state is SignupCubitSuccess) {
          Navigator.of(context).pop(); // Close loading dialog
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(
              message: "Sign up successful!",
            ),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.signInRoute,
                (route) => false,
          );
        } else if (state is SignupCubitLoading) {
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
        } else if (state is SignupCubitError) {
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
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(

              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSize.s40.h),
                  // Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                    SizedBox(height: AppSize.s40.h),

                    // ==== Input Fields in Styled Container ====
                    Container(
                      padding: EdgeInsets.all(AppPadding.p12.w),
                      decoration: BoxDecoration(
                        color: ColorManager.containerGray.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(AppSize.s12.r),
                      ),
                      child: Column(
                        children: [
                          BuildTextField(
                            controller: _nameController,
                            backgroundColor: ColorManager.white,
                            hint: 'Enter your full name',
                            hintTextStyle: TextStyle(color: ColorManager.primary),
                            label: 'Full Name',
                            textInputType: TextInputType.name,
                            validation: AppValidators.validateFullName,
                          ),
                          SizedBox(height: AppSize.s18.h),
                          BuildTextField(
                            controller: _numberController,
                            hint: 'Enter your mobile number',
                            hintTextStyle: TextStyle(color: ColorManager.primary),
                            backgroundColor: ColorManager.white,
                            label: 'Mobile Number',
                            validation: AppValidators.validatePhoneNumber,
                            textInputType: TextInputType.phone,
                          ),
                          SizedBox(height: AppSize.s18.h),
                          BuildTextField(
                            controller: _emailController,
                            hint: 'Enter your email address',
                            hintTextStyle: TextStyle(color: ColorManager.primary),
                            backgroundColor: ColorManager.white,
                            label: 'Email Address',
                            validation: AppValidators.validateEmail,
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: AppSize.s18.h),
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
                          SizedBox(height: AppSize.s18.h),
                          BuildTextField(
                            controller: _RepasswordController,
                            hint: 'Re-enter your password',
                            backgroundColor: ColorManager.white,
                            label: 'Confirm Password',
                            validation: (value) {
                              if (value != _passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                            isObscured: true,
                            textInputType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppSize.s40.h),

                    // ==== Sign Up Button ====
                    Center(
                      child: SizedBox(
                        height: AppSize.s60.h,
                        width: MediaQuery.of(context).size.width * .9,
                        child: CustomElevatedButton(
                          label: 'Sign Up',
                          backgroundColor: ColorManager.darkPrimary,
                          textStyle: getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s20,
                          ),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<SignupCubit>().signUp(SignUpRequest(
                                password: _passwordController.text,
                                email: _emailController.text,
                                name: _nameController.text,
                                phone: _numberController.text,
                                rePassword: _RepasswordController.text,
                              ));
                            }
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: AppSize.s20.h),

                    // ==== Already have an account ====
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: getSemiBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                        SizedBox(width: AppSize.s8.w),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, Routes.signInRoute),
                          child: Text(
                            'Sign In',
                            style: getSemiBoldStyle(
                              color: ColorManager.darkPrimary,
                            ).copyWith(fontSize: FontSize.s16.sp),
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
