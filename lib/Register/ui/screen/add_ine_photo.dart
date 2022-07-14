import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/components/app_bar.dart';
import 'package:petfind/RegisterPet/ui/widget/continue_button_pet_Register.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:intl/intl.dart';
import 'package:petfind/components/rounded_btn.dart';

class IneOwnerRegister extends StatefulWidget {
  const IneOwnerRegister({Key? key}) : super(key: key);

  @override
  State<IneOwnerRegister> createState() => _IneOwnerRegisterState();
}

class _IneOwnerRegisterState extends State<IneOwnerRegister> {
  var imageFile;
  var listImagePath = [];
  List<SizedBox> listImage = [];

  // var loginController = LoginController(LoginApiRepository());
  TextEditingController dateinput = TextEditingController();
  TextEditingController _textControllerPetName =
      TextEditingController(text: "");

  int cantidad = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              AppBarRegister(width),
              Padding(
                padding: EdgeInsets.only(right: width * 0.5),
                child: Column(
                  children: const <Widget>[
                    Text(
                      Labels.pet_data,
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      Labels.petImages,
                      style: TextStyle(
                        fontSize: 30,
                        color: ColorsViews.pink_word,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.8,
                child: const Text(
                  Labels.beSureToUpload,
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorsViews.grey_word,
                  ),
                ),
              ),
              _setImageView(width, height),
              RoundedButton(
                btnText: Labels.continueText,
                color: (cantidad > 0) ? ColorsViews.pink_word : Colors.grey,
                onPressed: () async {
                  if(cantidad > 0){
                    Navigator.pushNamed(context, '/homePetAdoptForm');
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorsViews.pink_word,
          onPressed: () {
            _showSelectionDialog(context, width);
          },
          child: Icon(Icons.camera_alt),
        ),
      ),
    );
  }

  Future<void> _showSelectionDialog(BuildContext context, width) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera(context, width);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  void _openGallery(BuildContext context) async {
    ImagePicker picker = ImagePicker();
    var picture = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (picture != null) {
        cantidad ++;
        listImagePath.add(picture.path);
        imageFile = File(picture.path);
      }
    });
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context, width) async {
    var picker = ImagePicker();
    var picture = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (picture != null) {
        cantidad ++;
        listImagePath.add(picture.path);
        imageFile = File(picture.path);
      }
    });
    Navigator.of(context).pop();
  }

  Widget _setImageView(width, heigth) {
    if (imageFile != null) {
      return Padding(
        padding: EdgeInsets.only(
          top: heigth * 0.05,
          left: width * 0.1,
          right: width * 0.1,
        ),
        child: SizedBox(
          width: width,
          height: heigth * 0.5,
          child: Image.file(imageFile),
        ),
      );
    } else {
      return const Text(" ");
    }
  }


}
