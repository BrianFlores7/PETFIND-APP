import 'package:flutter/material.dart';
import 'package:petfind/AdoptForm/ui/widget/register_adopt_owner.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/components/app_bar.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:intl/intl.dart';

class PetAdoptForm extends StatefulWidget {
  const PetAdoptForm({Key? key}) : super(key: key);

  @override
  State<PetAdoptForm> createState() => _PetAdoptFormState();
}

class _PetAdoptFormState extends State<PetAdoptForm> {
  // var loginController = LoginController(LoginApiRepository());
  TextEditingController dateinput = TextEditingController();
  TextEditingController _textControllerOwnerName =
      TextEditingController(text: "");
  TextEditingController _textControllerOwnerAddress =
      TextEditingController(text: "");
  TextEditingController _textControllerOwnerSuburb =
      TextEditingController(text: "");
  TextEditingController _textControllerOwnerCP =
      TextEditingController(text: "");

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

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
              const Text(
                Labels.your_data,
                style: TextStyle(fontSize: 40),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            Labels.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: ColorsViews.pink_word),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _textControllerOwnerName,
                            style: (const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            )),
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              hintText: Labels.hint_text_pet_name,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            Labels.address,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: ColorsViews.pink_word),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _textControllerOwnerAddress,
                            style: (const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            )),
                            cursorColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            Labels.suburb,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: ColorsViews.pink_word),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _textControllerOwnerSuburb,
                            style: (const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            )),
                            cursorColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            Labels.postal_code,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: ColorsViews.pink_word),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _textControllerOwnerCP,
                            style: (const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            )),
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    RegisterAdoptOwnerBtn(
                      textControllerOwnerName: _textControllerOwnerName,
                      textControllerOwnerAddress: _textControllerOwnerAddress,
                      textControllerOwnerSuburb: _textControllerOwnerSuburb,
                      textControllerOwnerCP: _textControllerOwnerCP,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
