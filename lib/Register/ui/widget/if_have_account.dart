import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';


class If_have_account extends StatelessWidget {
  const If_have_account({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          Labels.already_have_account,
          style: TextStyle(
              color: ColorsViews.grey_word, fontWeight: FontWeight.w400),
        ),
        TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');
          },
          child: const Text(Labels.sign_in,
              style: TextStyle(
                color: ColorsViews.pink_word,
              )),
        )
      ],
    );
  }
}

