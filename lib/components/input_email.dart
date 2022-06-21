import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';


class InputEmail extends StatelessWidget {
  const InputEmail({
    Key? key,
    required TextEditingController textControllerEmail,
  })  : _textControllerEmail = textControllerEmail,
        super(key: key);

  final TextEditingController _textControllerEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            Labels.email,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: ColorsViews.pink_word,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _textControllerEmail,
            style: (const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            )),
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              hintText: Labels.email_example,
            ),
          ),
        ],
      ),
    );
  }
}
