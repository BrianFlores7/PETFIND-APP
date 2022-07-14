import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/RegisterPet/repository/register_controller.dart';
import 'package:petfind/RegisterPet/repository/register_pet_api.dart';
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
    // required this.loginController,
  })  : _textControllerName = textControllerName,
        _textControllerRace = textControllerRace,
        _textControllerDateOfBirth = textControllerDateOfBirth,
        _textControllerGender = textControllerGender,
        _textControllerDescription = textControllerPetDescription,
        super(key: key);

  final TextEditingController _textControllerName;
  final TextEditingController _textControllerRace;
  final TextEditingController _textControllerDateOfBirth;
  final String? _textControllerGender;
  final TextEditingController _textControllerDescription;
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
            EasyLoading.show(status: 'Cargando...');
            String? gender;
            if (_textControllerGender == 'Macho') {
              gender = 'M';
            } else {
              gender = 'H';
            }
            Pet pet = Pet(
                _textControllerName.text,
                _textControllerRace.text,
                _textControllerDateOfBirth.text,
                gender,
                'https://www.fundacion-affinity.org/sites/default/files/los-10-sonidos-principales-del-perro.jpg',
                'Brian',
                _textControllerDescription.text);
            var result = await registerPetController.registerPet(pet);
            EasyLoading.dismiss();
            if (result == 'true') {
              Navigator.pushNamed(context, '/petRegisterFinished');
            } else {
              var snackBar = snackBarNotification(Labels.something_went_wrong);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      ),
    );
  }
}
