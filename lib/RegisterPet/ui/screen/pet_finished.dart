import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:petfind/components/rounded_btn.dart';

class PetFinishedView extends StatelessWidget {
  const PetFinishedView({Key? key}) : super(key: key);

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
                top: height * 0.2,
                left: width * 0.1,
                right: width * 0.1,
              ),
              child: Column(
                children: [
                  const Text(
                    Labels.youreDone,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    width: width * 0.5,
                    child: Image.asset('assets/LOGO_PETFIND.png'),
                  ),
                  const Text(
                    Labels.registerDone,
                    style: TextStyle(fontSize: 20),
                  ),
                  Center(
                  child: RoundedButton(
                    btnText: Labels.continueText,
                    color: ColorsViews.pink_word,
                    onPressed: () async {
                      Navigator.pushNamed(context, '/success');
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
