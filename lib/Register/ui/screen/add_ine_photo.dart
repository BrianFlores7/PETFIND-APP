import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/Register/model/sign_in.dart';
import 'package:petfind/Register/repository/register_controller.dart';
import 'package:petfind/components/app_bar.dart';
import 'package:petfind/RegisterPet/ui/widget/continue_button_pet_Register.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:intl/intl.dart';
import 'package:petfind/components/rounded_btn.dart';
import 'package:petfind/components/snack_bar_notification.dart';
import 'package:simple_s3/simple_s3.dart';

class IneOwnerRegister extends StatefulWidget {
  IneOwnerRegister(
    this.textControllerUser,
    this.textControllerPassword,
    this.textControllerEmail,
    this.textControllerOwnerName,
    this.textControllerOwnerAddress,
    this.textControllerOwnerSuburb,
    this.textControllerOwnerCP,
    this.textControllerOwnerPhone,
    this.signInController,
  );
  final TextEditingController textControllerUser;
  final TextEditingController textControllerPassword;
  final TextEditingController textControllerEmail;
  final TextEditingController textControllerOwnerName;
  final TextEditingController textControllerOwnerAddress;
  final TextEditingController textControllerOwnerSuburb;
  final TextEditingController textControllerOwnerCP;
  final TextEditingController textControllerOwnerPhone;
  final RegisterController signInController;

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
  SimpleS3 _simpleS3 = SimpleS3();
  bool isLoading = false;
  bool uploaded = false;

  int cantidad = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final GlobalKey _scaffoldKey = GlobalKey();
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
                  var imageFile = await _upload(this.imageFile);
                  print(imageFile);
                  if (cantidad > 0) {
                    try {
                      EasyLoading.show(status: 'Cargando...');
                      SignInModel user = SignInModel(
                        widget.textControllerUser.text,
                        widget.textControllerPassword.text,
                        widget.textControllerEmail.text,
                        widget.textControllerOwnerName.text,
                        widget.textControllerOwnerAddress.text,
                        widget.textControllerOwnerSuburb.text,
                        widget.textControllerOwnerCP.text,
                        widget.textControllerOwnerPhone.text,
                        imageFile as String,
                      );

                      var result = await widget.signInController.signIn(user);
                      EasyLoading.dismiss();
                      if (result == 'true') {
                        Map key = {"scaffoldKey": _scaffoldKey};
                        Navigator.popAndPushNamed(
                          context,
                          '/success',
                          arguments: _scaffoldKey,
                        );
                      } else {
                        var snackBar =
                            snackBarNotification(Labels.something_went_wrong);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } catch (e) {
                      print(e);
                    }
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
        cantidad++;
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
        cantidad++;
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

  Future<String?> _upload(File selectedFile) async {
    String? result;

    if (result == null) {
      try {
        setState(() {
          isLoading = true;
        });
        result = await _simpleS3.uploadFile(
          selectedFile,
          'bucketramsesprueba1',
          'us-east-1:7cc6df81-3825-43b9-acb7-8ef7f3ddafb6',
          AWSRegions.usEast1,
          debugLog: true,
          s3FolderPath: "test",
          accessControl: S3AccessControl.publicRead,
        );
        print(result);
        setState(() {
          uploaded = true;
          isLoading = false;
        });
      } catch (e) {
        print(e.toString());
      }
    }
    return result;
  }
}
