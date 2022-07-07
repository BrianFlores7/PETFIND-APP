
import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';

class CardAdopt extends StatelessWidget {
  const CardAdopt({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/homeCatalog');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.07,
              ),
              child: const Text(
                Labels.adopt,
                style: TextStyle(
                  color: ColorsViews.pink_word,
                  fontSize: 35,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.25,
              height: height * 0.25,
            )
          ],
        ),
      ),
    );
  }
}
