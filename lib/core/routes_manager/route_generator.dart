import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/presentation/auth/screen/sign_in_screen/sign_in_screen.dart';
import 'package:ecommerce_app/features/presentation/auth/screen/sign_up_screen/sign_up_screen.dart';
import 'package:ecommerce_app/features/presentation/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // TODO: Add Routes
      // case Routes.loginRoute:
      // return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) =>const SignInScreen());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) =>const SignUpScreen());
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
