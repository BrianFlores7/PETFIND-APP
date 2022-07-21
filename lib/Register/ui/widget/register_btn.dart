import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/Register/ui/screen/add_ine_photo.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:petfind/components/rounded_btn.dart';
import '../../repository/register_controller.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IneOwnerRegister(
                    _textControllerUser,
                    _textControllerPassword,
                    _textControllerEmail,
                    _textControllerOwnerName,
                    _textControllerOwnerAddress,
                    _textControllerOwnerSuburb,
                    _textControllerOwnerCP,
                    _textControllerOwnerPhone,
                    signInController,
                  ),
                ),
              );
            } catch (e) {
              print(e.toString());
            }
            // Add login code
          },
        ),
      ),
    );
  }
}
