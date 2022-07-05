import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';

class TextHeader extends StatelessWidget {
  final width;
  final text;
  final textDescription;
  final textSubtitle;
  const TextHeader(this.width, this.text, this.textDescription, this.textSubtitle);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: width * 0.5),
          child: Column(
            children: <Widget>[
              Text(
                text,
                style: TextStyle(fontSize: 40),
              ),
              Text(
                textSubtitle,
                style: TextStyle(
                  fontSize: 30,
                  color: ColorsViews.pink_word,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: width * 0.8,
          child: Text(
            textDescription,
            style: const TextStyle(
              fontSize: 20,
              color: ColorsViews.grey_word,
            ),
          ),
        ),
      ],
    );
  }
}
