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
    final GlobalKey _scaffoldKey = new GlobalKey();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: ColorsViews.pink_word,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.1,
                    bottom: height * 0.1,
                    top: height * 0.05),
                child: const Text(
                  "Usuario",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.1,
                  bottom: height * 0.05,
                ),
                child: const Text(
                  "My adoptions",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/request');
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.1,
                    bottom: height * 0.05,
                  ),
                  child: const Text(
                    "Requested",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.1,
                  top: height * 0.4,
                ),
                child: const Text(
                  "Log out",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            AppBarHome(
              width: width,
              scaffoldKey: _scaffoldKey,
            ),
            TextHomeView(height: height, width: width),
            CardAdopt(width: width, height: height),
            CardGiveUpAdopt(width: width, height: height),
          ],
        ),
      ),
    );
  }
}
