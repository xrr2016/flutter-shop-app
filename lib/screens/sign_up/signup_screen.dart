import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_up/components/signup_body.dart';

class SignupScreen extends StatelessWidget {
  static String routeName = '/sign_up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SignupBody(),
    );
  }
}
