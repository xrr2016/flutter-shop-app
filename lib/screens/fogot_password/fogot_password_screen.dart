import 'package:flutter/material.dart';
import 'package:shop_app/screens/fogot_password/components/forgot_password_body.dart';

class FogotPasswordScreen extends StatelessWidget {
  static String routeName = '/fogot_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: ForgotPasswordBody(),
    );
  }
}
