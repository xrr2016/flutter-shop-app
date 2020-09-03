import 'package:flutter/material.dart';
import 'package:shop_app/screens/fogot_password/fogot_password_screen.dart';
import 'package:shop_app/screens/signin/signin_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SigninScreen.routeName: (context) => SigninScreen(),
  FogotPasswordScreen.routeName: (context) => FogotPasswordScreen(),
};
