import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/favorite_screen/favorite_screen.dart';
import 'package:ecommerce_app/features/main_layout/screen/main_layout.dart';
import 'package:ecommerce_app/features/product_details/presentation/screen/product_details.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // TODO: Add Routes
      // case Routes.loginRoute:
      // return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainLayout());
      case Routes.productDetails :
        return MaterialPageRoute(builder: (_)=>const ProductDetails());
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
            ));
  }
}
