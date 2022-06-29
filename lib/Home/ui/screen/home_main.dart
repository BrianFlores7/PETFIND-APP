import 'package:flutter/material.dart';
import 'package:petfind/Home/ui/widget/app_bar_home.dart';
import 'package:petfind/Home/ui/widget/card_adopt.dart';
import 'package:petfind/Home/ui/widget/card_give_up_adopt.dart';
import 'package:petfind/Home/ui/widget/text_home_view.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppBarHome(width: width),
            TextHomeView(height: height, width: width),
            CardAdopt(width: width, height: height),
            CardGiveUpAdopt(width: width, height: height),
          ],
        ),
      ),
    );
  }
}