import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../token/get_token.dart';
import '../model/sign_in.dart';
import 'register_repository.dart';

class RegisterApiRepository implements RegisterRepository {
  static const String URL = "http://10.0.2.2:3000/api/register";
  String token = "";

  @override
  Future<String> signInUser(SignInModel user) async {
    var result = 'false';

    Map data = {
      'email': user.email,
      'password': user.password,
      'username': user.user
    };

    String jsonObject = json.encode(data);
    var response = await http
        .post(Uri.parse(URL),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization': token,
            },
            encoding: Encoding.getByName("utf-8"),
            body: jsonObject)
        .then(
      (value) async {
        var status = jsonDecode(value.body);
        if (status['status'] != 'error') {
          return result = "true";
        }
      },
    );

    return result;
  }
}
