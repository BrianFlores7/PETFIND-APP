import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../token/get_token.dart';
import '../model/sign_in.dart';
import 'register_repository.dart';

class RegisterApiRepository implements RegisterRepository {
  static const String URL = "";
  String token = "";

  @override
  Future<String> signInUser(SignInModel user) async {
    var result = 'false';

    Map data = {
      'email': user.email,
      'password': user.password,
      'phone': user.phone
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
        if (value.statusCode.toString() == '201') {
          return result = "true";
        } else if (value.statusCode.toString() == '401') {
          token = await getToken();
          signInUser(user);
          return result = "true";
        }
      },
    );

    return result;
  }
}
