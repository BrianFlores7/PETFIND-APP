import 'package:flutter/material.dart';
import 'package:petfind/colors/colors_views.dart';


class InputUser extends StatelessWidget {
  const InputUser({
    Key? key,
    required TextEditingController textControllerEmail,
  })  : _textControllerEmail = textControllerEmail,
        super(key: key);

  final TextEditingController _textControllerEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'USERNAME',
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
                  color: ColorsViews.pink_word, fontWeight: FontWeight.w400)),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.white,
              obscureText: false,
              decoration: const InputDecoration(
                hintText: 'USEREXAMPLE',
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
