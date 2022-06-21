import 'package:flutter/material.dart';
import 'package:petfind/colors/colors_views.dart';

class inputPhone extends StatelessWidget {
  const inputPhone({
    Key? key,
    required TextEditingController textControllerPhone,
  })  : _textControllerPhone = textControllerPhone,
        super(key: key);

  final TextEditingController _textControllerPhone;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Numero de telefono',
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 13, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _textControllerPhone,
            style: (const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            )),
            keyboardType: TextInputType.phone,
            obscureText: false,
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              border: InputBorder.none,
              fillColor: ColorsViews.fill_color,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorsViews.border_color, width: 2.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
