import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:petfind/components/rounded_btn.dart';
import '../../model/sign_in.dart';
import '../../repository/register_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class registerBtn extends StatelessWidget {
  const registerBtn({
    Key? key,
    required TextEditingController textControllerEmail,
    required TextEditingController textControllerPassword,
    required TextEditingController textControllerUser,
    required this.signInController,
    required TextEditingController textControllerConfirmPassword,
  })  : _textControllerEmail = textControllerEmail,
        _textControllerPassword = textControllerPassword,
        _textControllerUser = textControllerUser,
        _textControllerConfirmPassword = textControllerConfirmPassword,
        super(key: key);

  final TextEditingController _textControllerEmail;
  final TextEditingController _textControllerPassword;
  final TextEditingController _textControllerUser;
  final TextEditingController _textControllerConfirmPassword;
  final RegisterController signInController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: RoundedButton(
          btnText: Labels.create_account,
          color: ColorsViews.pink_word,
          onPressed: () async {
            try {
              EasyLoading.show(status: 'Cargando...');
              SignInModel user = SignInModel(_textControllerEmail.text,
                  _textControllerPassword.text, _textControllerUser.text);
              if (_textControllerConfirmPassword.text ==
                  _textControllerPassword.text) {
                var result = await signInController.signIn(user);
                EasyLoading.dismiss();
                if (result == 'true') {
                  Navigator.popAndPushNamed(context, '/success');
                } else {
                  const snackBar = SnackBar(
                    content: Text('Error, datos no validos.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
              else{
                final snackBar = SnackBar(
                    content: const Text('Las contraseñas no coinciden.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            } catch (e) {
              print(e);
            }
            // Add login code
          },
        ),
      ),
    );
  }
}
