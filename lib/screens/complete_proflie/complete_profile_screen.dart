import 'package:flutter/material.dart';
import 'package:shop_app/screens/complete_proflie/components/complete_profile_body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = '/complete_profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: CompleteProfileBody(),
    );
  }
}
