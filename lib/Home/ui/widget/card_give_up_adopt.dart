
import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';

class CardGiveUpAdopt extends StatelessWidget {
  const CardGiveUpAdopt({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: width * 0.25,
            height: height * 0.25,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.2,
            ),
            child: const Text(
              Labels.give_up_for_adoption,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ColorsViews.pink_word,
                fontSize: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
