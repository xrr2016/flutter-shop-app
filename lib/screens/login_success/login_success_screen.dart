import 'package:flutter/material.dart';

import 'login_success_body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = 'login_success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Login Success'),
      ),
      body: LoginSuccessBody(),
    );
  }
}
