import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/di/di.dart';
import 'core/routes_manager/route_generator.dart';
late SharedPreferences preferences;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
preferences=await SharedPreferences.getInstance();
  setupServiceLocator();



  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    String token=preferences.getString("token")??"";

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute:token.isEmpty? Routes.signInRoute :Routes.mainRoute,
      ),
    );
  }
}
