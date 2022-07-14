import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:petfind/components/rounded_btn.dart';
import 'package:petfind/components/snack_bar_notification.dart';
import 'package:petfind/validations/email_password.dart';
import '../../model/sign_in.dart';
import '../../repository/register_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class registerBtn extends StatelessWidget {
  registerBtn({
    Key? key,
    required TextEditingController textControllerEmail,
    required TextEditingController textControllerPassword,
    required TextEditingController textControllerUser,
    required this.signInController,
    required TextEditingController textControllerOwnerName,
    required TextEditingController textControllerOwnerAddress,
    required TextEditingController textControllerOwnerSuburb,
    required TextEditingController textControllerOwnerCP,
    required TextEditingController textControllerOwnerPhone,
  })  : _textControllerEmail = textControllerEmail,
        _textControllerPassword = textControllerPassword,
        _textControllerUser = textControllerUser,
        _textControllerOwnerName = textControllerOwnerName,
        _textControllerOwnerAddress = textControllerOwnerAddress,
        _textControllerOwnerSuburb = textControllerOwnerSuburb,
        _textControllerOwnerCP = textControllerOwnerCP,
        _textControllerOwnerPhone = textControllerOwnerPhone,
        super(key: key);

  final TextEditingController _textControllerEmail;
  final TextEditingController _textControllerPassword;
  final TextEditingController _textControllerUser;
  final RegisterController signInController;
  final TextEditingController dateinput = TextEditingController();
  final TextEditingController _textControllerOwnerName;
  final TextEditingController _textControllerOwnerAddress;
  final TextEditingController _textControllerOwnerSuburb;
  final TextEditingController _textControllerOwnerCP;
  final TextEditingController _textControllerOwnerPhone;

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
              // EasyLoading.show(status: 'Cargando...');
              SignInModel user = SignInModel(
                _textControllerEmail.text,
                _textControllerPassword.text,
                _textControllerUser.text,
                _textControllerOwnerName.text,
                _textControllerOwnerAddress.text,
                _textControllerOwnerSuburb.text,
                _textControllerOwnerCP.text,
                _textControllerOwnerPhone.text,
              );
              print(user);

              // if (validateEmail(_textControllerEmail.text) &&
              //     validatePassword(_textControllerPassword.text)) {
              //   var result = await signInController.signIn(user);
              //   EasyLoading.dismiss();
              //   if (result == 'true') {
              //     Navigator.popAndPushNamed(context, '/success');
              //   } else {
              //     var snackBar =
              //         snackBarNotification(Labels.something_went_wrong);
              //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //   }
              // } else {
              //   var snackBar =
              //       snackBarNotification(Labels.password_or_email_incorrect);
              //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // }
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
