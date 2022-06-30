import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:petfind/components/snack_bar_notification.dart';
import 'package:petfind/validations/email_password.dart';
import '../../../components/rounded_btn.dart';
import '../../model/login.dart';
import '../../repository/login_controller.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    Key? key,
    required TextEditingController textControllerEmail,
    required TextEditingController textControllerPassword,
    required this.loginController,
  })  : _textControllerEmail = textControllerEmail,
        _textControllerPassword = textControllerPassword,
        super(key: key);

  final TextEditingController _textControllerEmail;
  final TextEditingController _textControllerPassword;
  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: RoundedButton(
          btnText: Labels.login,
          color: ColorsViews.pink_word,
          onPressed: () async {
            // Add login code
            try {
              LoginModel user = LoginModel(
                _textControllerEmail.text,
                _textControllerPassword.text,
              );
              EasyLoading.show(status: 'Cargando...');
              var result = await loginController.login(user);
              
              EasyLoading.dismiss();
              if (result == 'true' && validatePassword(_textControllerPassword.text)) {
                Navigator.popAndPushNamed(context, '/success');
              } else {
                var snackBar = snackBarNotification(Labels.password_or_email_incorrect);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            } catch (e) {
              print(e);
            }
          },
        ),
      ),
    );
  }
}
