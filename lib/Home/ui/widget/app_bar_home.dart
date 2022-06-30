
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.05,
        right: width * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_sharp,
              size: 40,
            ),
          ),
          SizedBox(
            width: width * 0.2,
            child: Image.asset('assets/LOGO_PETFIND.png'),
          ),
        ],
      ),
    );
  }
}
