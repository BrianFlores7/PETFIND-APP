import 'package:flutter/material.dart';
import 'package:petfind/Labels/labels.dart';
import 'package:petfind/colors/colors_views.dart';

Padding signUpText() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 8),
      child: Text(
        Labels.sign_up,
        style: TextStyle(
            color: ColorsViews.black_word,
            fontWeight: FontWeight.w600,
            fontSize: 35),
      ),
    );
  }