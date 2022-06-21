
import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';

import '../../../colors/colors_views.dart';

class IfDontHaveAccount extends StatelessWidget {
  const IfDontHaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Labels.dont_have_account,
          style: TextStyle(
              color: ColorsViews.grey_word,
              fontWeight: FontWeight.w400),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register_page');
          },
          child: const Text(
            Labels.sign_up,
            style: TextStyle(
              color: ColorsViews.pink_word,
            ),
          ),
        )
      ],
    );
  }
}
