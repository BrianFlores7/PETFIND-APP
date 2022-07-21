import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/RegisterPet/repository/register_controller.dart';
import 'package:petfind/RegisterPet/repository/register_pet_api.dart';
import 'package:petfind/RegisterPet/ui/screen/pet_image.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:petfind/components/snack_bar_notification.dart';
import 'package:petfind/model/pet_model.dart';
import '../../../components/rounded_btn.dart';

class RegisterPetBtn extends StatelessWidget {
  RegisterPetBtn({
    Key? key,
    required TextEditingController textControllerName,
    required TextEditingController textControllerRace,
    required TextEditingController textControllerDateOfBirth,
    required String? textControllerGender,
    required TextEditingController textControllerPetDescription,
    required String userId,
    // required this.loginController,
  })  : _textControllerName = textControllerName,
        _textControllerRace = textControllerRace,
        _textControllerDateOfBirth = textControllerDateOfBirth,
        _textControllerGender = textControllerGender,
        _textControllerDescription = textControllerPetDescription,
        _userId = userId,
        super(key: key);

  final TextEditingController _textControllerName;
  final TextEditingController _textControllerRace;
  final TextEditingController _textControllerDateOfBirth;
  final String? _textControllerGender;
  final TextEditingController _textControllerDescription;
  final String _userId;
  var registerPetController = RegisterController(RegisterApiPetRepository());
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PetImageRegister(
                  _textControllerName,
                  _textControllerRace,
                  _textControllerDateOfBirth,
                  _textControllerGender,
                  _textControllerDescription,
                  _userId,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
