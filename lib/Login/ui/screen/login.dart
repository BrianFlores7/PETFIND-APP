import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';
import '../../repository/login_api.dart';
import '../../repository/login_controller.dart';
import '../widget/if_dont_have_account.dart';
import '../../../components/input_user.dart';
import '../widget/login_btn.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var loginController = LoginController(LoginApiRepository());
  TextEditingController _textControllerUser = TextEditingController(text: "");
  TextEditingController _textControllerPassword =
      TextEditingController(text: "");
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: width * 0.5,
                child: Image.asset('assets/LOGO_PETFIND.png'),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 8),
                      child: Text(
                        Labels.login,
                        style: TextStyle(
                            color: ColorsViews.black_word,
                            fontWeight: FontWeight.w600,
                            fontSize: 40),
                      ),
                    ),
                    InputUser(textControllerUser: _textControllerUser),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
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
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                            obscureText: _passwordVisible,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              hintText: Labels.hint_text_password,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: ColorsViews.hide_password,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorsViews.border_color,
                                    width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    LoginBtn(
                        textControllerEmail: _textControllerUser,
                        textControllerPassword: _textControllerPassword,
                        loginController: loginController),
                    const Center(
                      child: Text(
                        Labels.forgot_password,
                        style: TextStyle(color: ColorsViews.pink_word),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const IfDontHaveAccount()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
