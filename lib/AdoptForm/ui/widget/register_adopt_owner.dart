import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';
import '../../../components/rounded_btn.dart';

class RegisterAdoptOwnerBtn extends StatelessWidget {
  const RegisterAdoptOwnerBtn({
    Key? key,
    required TextEditingController textControllerOwnerName,
    required TextEditingController textControllerOwnerAddress,
    required TextEditingController textControllerOwnerSuburb,
    required TextEditingController textControllerOwnerCP,
    // required this.loginController,
  })  : _textControllerOwnerName = textControllerOwnerName,
        _textControllerOwnerAddress = textControllerOwnerAddress,
        _textControllerOwnerSuburb = textControllerOwnerSuburb,
        _textControllerOwnerCP = textControllerOwnerCP,
        super(key: key);

  final TextEditingController _textControllerOwnerName;
  final TextEditingController _textControllerOwnerAddress;
  final TextEditingController _textControllerOwnerSuburb;
  final TextEditingController _textControllerOwnerCP;
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
            Navigator.pushNamed(context, '/ownerINEForm');
          },
        ),
      ),
    );
  }
}
