
import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';

class TextHomeView extends StatelessWidget {
  const TextHomeView({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.05, right: width * 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            Labels.welcome,
            style:
                TextStyle(color: ColorsViews.pink_word, fontSize: 40),
          ),
          Text(
            Labels.what_do_you_want_to_do,
            style: TextStyle(
              color: ColorsViews.grey_word,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
