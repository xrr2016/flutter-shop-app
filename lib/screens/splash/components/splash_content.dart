import 'package:flutter/material.dart';

import '../../../constans.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  final String text;
  final String image;

  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          'TOKOTO',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(36),
          ),
        ),
        Text(text),
        Spacer(flex: 2),
        Image.asset(
          image,
          width: getProportionateScreenWidth(235),
          height: getProportionateScreenHeight(265),
        ),
      ],
    );
  }
}
