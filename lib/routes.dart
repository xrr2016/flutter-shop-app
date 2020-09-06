import 'package:flutter/material.dart';
import 'package:shop_app/screens/complete_proflie/complete_profile_screen.dart';
import 'package:shop_app/screens/fogot_password/fogot_password_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/sign_in/signin_screen.dart';
import 'package:shop_app/screens/sign_up/signup_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SigninScreen.routeName: (context) => SigninScreen(),
  SignupScreen.routeName: (context) => SignupScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  FogotPasswordScreen.routeName: (context) => FogotPasswordScreen(),
  CompleteProfileScreen.routeName: (conteext) => CompleteProfileScreen(),
};
