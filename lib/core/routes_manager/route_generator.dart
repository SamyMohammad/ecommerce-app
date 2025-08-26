import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/data/model/products/product.dart';
import 'package:ecommerce_app/features/auth/presentation/manger/signUp_cubit/sign_upcubit_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/cart/screens/cart_screen.dart';
import 'package:ecommerce_app/features/main_layout/main_layout.dart';
import 'package:ecommerce_app/features/product_details/presentation/screen/product_details.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/Products_catalog_argument.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repos/AuthRepo/auth_repo.dart';
import '../../features/auth/presentation/manger/login_cubit/login_cubit.dart';
import '../di/di.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (_) => const MainLayout(),
        );

      case Routes.productsScreenRoute:
        return MaterialPageRoute(
            builder: (_) =>
                ProductsScreen(settings.arguments as ProductsCatalogArgument?));

      case Routes.productDetails:
        return MaterialPageRoute(
            builder: (_) => ProductDetails(
                  product: settings.arguments as Product,
                ));

      case Routes.signInRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<LoginCubit>(
                  create: (context) => LoginCubit(getIt<AuthRepo>()),
                  child: const SignInScreen(),
                ));

      case Routes.signUpRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<SignupCubit>(
                create: (context) => SignupCubit(getIt<AuthRepo>()),
                child: const SignUpScreen()));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
