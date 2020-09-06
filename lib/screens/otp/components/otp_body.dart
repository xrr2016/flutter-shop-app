import 'package:flutter/material.dart';
import 'package:shop_app/constans.dart';
import 'package:shop_app/size_config.dart';

import './otp_form.dart';

class OtpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "OTP Verifacation",
                style: headingStyle,
              ),
              Text('We sent your code to +86 189 8601 ****'),
              buildCounter(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // Resend
                },
                child: Text(
                  'Resend OTP Code',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('This code will expired in '),
        TweenAnimationBuilder(
          duration: Duration(seconds: 30),
          tween: Tween(begin: 30.0, end: 0),
          onEnd: () {},
          builder: (BuildContext context, num value, Widget child) {
            return Text(
              "00:${value.toInt()}",
              style: TextStyle(color: kPrimaryColor),
            );
          },
        ),
      ],
    );
  }
}
