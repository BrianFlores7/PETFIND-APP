import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/Register/ui/widget/logo_sign_up.dart';
import 'package:petfind/Register/ui/widget/sign_up_text.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:petfind/components/input_email.dart';
import 'package:petfind/components/input_user.dart';
import '../../repository/register_api.dart';
import '../../repository/register_controller.dart';
import '../widget/go_back_button.dart';
import '../widget/if_have_account.dart';

import '../widget/register_btn.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _passwordVisible = false;
  bool _passwordVisibleConfirm = false;

  var signInController = RegisterController(RegisterApiRepository());
  TextEditingController _textControllerEmail = TextEditingController(text: "");
  TextEditingController _textControllerPassword =
      TextEditingController(text: "");
  TextEditingController _textControllerPasswordConfirm =
      TextEditingController(text: "");
  TextEditingController _textControllerUser = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          elevation: 0,
          leading: goBackButton(context),
          backgroundColor: Colors.white),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            logoSignUp(width),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.02,
                right: width * 0.04,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  signUpText(),
                  InputUser(textControllerUser: _textControllerUser),
                  passwordField(),
                  confirmPasswordField(),
                  InputEmail(textControllerEmail: _textControllerEmail),
                  registerBtn(
                    textControllerEmail: _textControllerEmail,
                    textControllerPassword: _textControllerPassword,
                    textControllerConfirmPassword: _textControllerPasswordConfirm,
                    textControllerUser: _textControllerUser,
                    signInController: signInController,
                  ),
                  const If_have_account()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container confirmPasswordField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            Labels.confirm_password,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: ColorsViews.pink_word),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _textControllerPasswordConfirm,
            style: (const TextStyle(
              color: ColorsViews.black_word,
              fontWeight: FontWeight.w400,
            )),
            obscureText: _passwordVisibleConfirm,
            cursorColor: ColorsViews.black_word,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: ColorsViews.hide_password,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _passwordVisibleConfirm = !_passwordVisibleConfirm;
                  });
                },
              ),
              hintText: Labels.hint_text_password,
            ),
          ),
        ],
      ),
    );
  }

  Container passwordField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            Labels.password,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: ColorsViews.pink_word),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _textControllerPassword,
            style: (const TextStyle(
              color: ColorsViews.black_word,
              fontWeight: FontWeight.w400,
            )),
            obscureText: _passwordVisible,
            cursorColor: ColorsViews.black_word,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: ColorsViews.hide_password,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              hintText: Labels.hint_text_password,
            ),
          ),
        ],
      ),
    );
  }
}
