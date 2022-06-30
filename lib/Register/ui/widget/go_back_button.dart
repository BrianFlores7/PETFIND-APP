import 'package:flutter/material.dart';
import 'package:petfind/colors/colors_views.dart';


Widget goBackButton(BuildContext context) {
  return IconButton(
      icon: const Icon(Icons.arrow_back, color: ColorsViews.arrow_back),
      onPressed: () {
        Navigator.of(context).pop(true);
      });
}
