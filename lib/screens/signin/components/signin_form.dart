import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_errors.dart';
import 'package:shop_app/screens/fogot_password/fogot_password_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';

import '../../../constans.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _errors = [];

  String email;
  String password;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  }),
              Text('Remember me'),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  FogotPasswordScreen.routeName,
                ),
                child: Text(
                  'Forgot password',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          FormErrors(errors: _errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              print(_errors.length);
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) {
        password = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty && _errors.contains(kPassNullError)) {
          _errors.remove(kPassNullError);
        } else if (value.length >= 8 && _errors.contains(kShortPassError)) {
          _errors.remove(kShortPassError);
        }
        setState(() {});
        return null;
      },
      // validator: (value) {
      //   if (value.isEmpty && !_errors.contains(kPassNullError)) {
      //     _errors.add(kPassNullError);
      //   } else if (value.length < 8 && !_errors.contains(kShortPassError)) {
      //     _errors.add(kShortPassError);
      //   }
      //   setState(() {});
      //   return "";
      // },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) {
        email = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty && _errors.contains(kEmailNullError)) {
          _errors.remove(kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value) &&
            _errors.contains(kInvalidEmailError)) {
          _errors.remove(kInvalidEmailError);
        }
        setState(() {});
      },
      // validator: (value) {
      //   if (value.isEmpty && !_errors.contains(kEmailNullError)) {
      //     _errors.add(kEmailNullError);
      //   } else if (!emailValidatorRegExp.hasMatch(value) &&
      //       !_errors.contains(kInvalidEmailError)) {
      //     _errors.add(kInvalidEmailError);
      //   }
      //   setState(() {});
      //   return "";
      // },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }
}
