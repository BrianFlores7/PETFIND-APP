import 'dart:convert';
import 'package:http/http.dart' as http;

const String getTokenUrl = "";

Future<String> getToken() async {
  var token;

  Map data = {
    'username': '',
    'password': '',
  };

  String jsonObject = json.encode(data);

  var response = await http
      .post(Uri.parse(getTokenUrl),
          headers: <String, String>{'contentType': 'application/json'},
          encoding: Encoding.getByName("utf-8"),
          body: jsonObject)
      .then(
    (value) {
      token = value.headers['authorization'];
    },
  );
  return token;
}
