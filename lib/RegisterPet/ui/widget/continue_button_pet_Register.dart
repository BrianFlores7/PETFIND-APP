import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';
import '../../../components/rounded_btn.dart';

class RegisterPetBtn extends StatelessWidget {
  const RegisterPetBtn({
    Key? key,
    required TextEditingController textControllerName,
    required TextEditingController textControllerRace,
    required TextEditingController textControllerDateOfBirth,
    // required this.loginController,
  })  : _textControllerName = textControllerName,
        _textControllerRace = textControllerRace,
        _textControllerDateOfBirth = textControllerDateOfBirth,
        super(key: key);

  final TextEditingController _textControllerName;
  final TextEditingController _textControllerRace;
  final TextEditingController _textControllerDateOfBirth;
  // final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: RoundedButton(
          btnText: Labels.continueText,
          color: ColorsViews.pink_word,
          onPressed: () async {
            Navigator.pushNamed(context, '/petRegisterImage');
          },
        ),
      ),
    );
  }
}
