import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/RegisterPet/ui/widget/continue_button_pet_Register.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:intl/intl.dart';

class PetImageRegister extends StatefulWidget {
  const PetImageRegister({Key? key}) : super(key: key);

  @override
  State<PetImageRegister> createState() => _PetImageRegisterState();
}

class _PetImageRegisterState extends State<PetImageRegister> {
  var imageFile;
  var listImagePath = [];
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
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.05,
                right: width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.2,
                    child: Image.asset('assets/LOGO_PETFIND.png'),
                  ),
                ],
              ),
            ),
            const Text(
              Labels.pet_data,
              style: TextStyle(fontSize: 40),
            ),
            const Text(
              Labels.petImages,
              style: TextStyle(
                fontSize: 30,
                color: ColorsViews.pink_word,
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
            _setImageView(width, height)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorsViews.pink_word,
          onPressed: () {
            _showSelectionDialog(context);
          },
          child: Icon(Icons.camera_alt),
        ),
      ),
    );
  }

  Future<void> _showSelectionDialog(BuildContext context) {
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
                        _openCamera(context);
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
        listImagePath.add(picture.path);
        imageFile = File(picture.path);
        cantidad++;
      }
    });
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context) async {
    var picker = ImagePicker();
    var picture = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (picture != null) {
        listImagePath.add(picture.path);
        imageFile = File(picture.path);
        cantidad++;
      }
    });
    Navigator.of(context).pop();
  }

  Widget _setImageView(width, heigth) {
    if (imageFile != null) {
      print(listImagePath);
      return Padding(
        padding: EdgeInsets.only(
          top: heigth * 0.05,
          left: width * 0.1,
          right: width * 0.1,
        ),
        child: SizedBox(
          width: width,
          height: heigth * 0.5,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cantidad,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(
                      width: width * 0.5,
                      child: Image.file(
                        imageFile,
                      ),
                    ),
                  ],
                );
              }),
        ),
      );
    } else {
      return const Text(" ");
    }
  }
}
