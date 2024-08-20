import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/presentation/main%20layout/screen/main_layout.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // TODO: Add Routes
      // case Routes.loginRoute:
      // return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainLayout());
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
