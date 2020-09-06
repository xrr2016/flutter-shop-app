import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_errors.dart';
import 'package:shop_app/screens/complete_proflie/complete_profile_screen.dart';

import '../../../constans.dart';
import '../../../size_config.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _errors = [];

  String email;
  String password;
  String confirmPassword;

  void addError({String error}) {
    if (!_errors.contains(error)) {
      _errors.add(error);
    }
  }

  void removeError({String error}) {
    if (_errors.contains(error)) {
      _errors.remove(error);
    }
  }

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
          buildConfirmPasswordFormField(),
          FormErrors(errors: _errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) {
        confirmPassword = newValue;
      },
      onChanged: (value) {
        if (password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        setState(() {});
        return null;
      },
      validator: (value) {
        // if (value.isEmpty) {
        // } else if (password != value) {
        //   addError(error: kMatchPassError);
        // }
        // setState(() {});
        // return "";
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re- Enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: "assets/icons/Lock.svg",
        ),
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
        password = value;
        setState(() {});
        return null;
      },
      validator: (value) {
        // if (value.isEmpty && !_errors.contains(kPassNullError)) {
        //   _errors.add(kPassNullError);
        // } else if (value.length < 8 && !_errors.contains(kShortPassError)) {
        //   _errors.add(kShortPassError);
        // }
        // setState(() {});
        // return "";
      },
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
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {
        email = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        setState(() {});
      },
      validator: (value) {
        // if (value.isEmpty) {
        //   addError(error: kEmailNullError);
        // } else if (!emailValidatorRegExp.hasMatch(value)) {
        //   addError(error: kInvalidEmailError);
        // }
        // setState(() {});
        // return "";
      },
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
