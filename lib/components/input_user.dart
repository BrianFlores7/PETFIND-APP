import 'package:flutter/material.dart';
import 'package:petfind/colors/colors_views.dart';

class InputUser extends StatelessWidget {
  const InputUser({
    Key? key,
    required TextEditingController textControllerUser,
  })  : _textControllerUser = textControllerUser,
        super(key: key);

  final TextEditingController _textControllerUser;

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
              controller: _textControllerUser,
              style: (const TextStyle(
                color: ColorsViews.black_word,
                fontWeight: FontWeight.w400,
              )),
              keyboardType: TextInputType.emailAddress,
              cursorColor: ColorsViews.black_word,
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
