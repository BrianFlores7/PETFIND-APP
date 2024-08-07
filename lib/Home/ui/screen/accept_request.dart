import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:petfind/components/rounded_btn.dart';

class AcceptRequest extends StatelessWidget {
  const AcceptRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    String phone = ModalRoute.of(context)!.settings.arguments as String;
    final GlobalKey _scaffoldKey = GlobalKey();
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
                    'Congrats! You accepted.',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Contact phone: $phone.',
                    style: TextStyle(fontSize: 20),
                  ),
                  Center(
                    child: RoundedButton(
                      btnText: 'Go back',
                      color: ColorsViews.pink_word,
                      onPressed: () async {
                        Map key = {"scaffoldKey": _scaffoldKey};
                        Navigator.pop(context);
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
