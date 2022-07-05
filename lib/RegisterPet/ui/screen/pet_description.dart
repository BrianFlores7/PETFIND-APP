import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/components/app_bar.dart';
import 'package:petfind/RegisterPet/ui/widget/header_text.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:petfind/components/rounded_btn.dart';

class PetDescription extends StatefulWidget {
  PetDescription({Key? key}) : super(key: key);

  @override
  State<PetDescription> createState() => _PetDescriptionState();
}

class _PetDescriptionState extends State<PetDescription> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textControllerPetDescription =
        TextEditingController(text: "");
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              AppBarRegister(width),
              TextHeader(
                width,
                Labels.pet_data,
                Labels.descriptionLarge,
                Labels.description,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: height * 0.1, horizontal: width * 0.1),
                child: TextField(
                  controller: _textControllerPetDescription,
                  style: (const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  )),
                  cursorColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: RoundedButton(
                    btnText: Labels.continueText,
                    color: ColorsViews.pink_word,
                    onPressed: () async {
                      Navigator.pushNamed(context, '/petRegisterFinished');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
