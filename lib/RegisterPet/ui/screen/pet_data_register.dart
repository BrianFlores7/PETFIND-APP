import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:intl/intl.dart';

class PetDataRegister extends StatefulWidget {
  const PetDataRegister({Key? key}) : super(key: key);

  @override
  State<PetDataRegister> createState() => _PetDataRegisterState();
}

class _PetDataRegisterState extends State<PetDataRegister> {
  // var loginController = LoginController(LoginApiRepository());
  TextEditingController dateinput = TextEditingController();
  TextEditingController _textControllerPetName =
      TextEditingController(text: "");
  TextEditingController _textControllerPetRace =
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
            Padding(
              padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 8),
                    child: Text(
                      Labels.login,
                      style: TextStyle(
                          color: ColorsViews.black_word,
                          fontWeight: FontWeight.w600,
                          fontSize: 40),
                    ),
                  ),
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
                          controller: _textControllerPetName,
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
                          Labels.race,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: ColorsViews.pink_word),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _textControllerPetRace,
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
                    child: const Text(
                      Labels.date_of_birth,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ColorsViews.pink_word),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: width * 0.05, left: width * 0.05),
                    child: TextField(
                      controller:
                          dateinput, //editing controller of this TextField
                      decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                      ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101),
                        );

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(
                            () {
                              dateinput.text =
                                  formattedDate; //set output date to TextField value.
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
