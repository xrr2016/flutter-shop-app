import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class FormErrors extends StatelessWidget {
  final List<String> errors;

  const FormErrors({Key key, this.errors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => formErrorText(text: errors[index]),
      ),
    );
  }

  Row formErrorText({String text}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          width: getProportionateScreenWidth(14),
          height: getProportionateScreenHeight(14),
        ),
        SizedBox(width: getProportionateScreenWidth(10)),
        Text(text),
      ],
    );
  }
}
