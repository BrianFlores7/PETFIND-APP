import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../token/get_token.dart';
import '../model/login.dart';
import 'login_repository.dart';

class LoginApiRepository implements LoginRepository {
  String token = '';
  static const String URL = "";

  @override
  Future<String> loginUser(LoginModel user) async {
    var result = 'false';

    Map data = {
      'email': user.email,
      'password': user.password,
    };

    //
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
        if (value.statusCode.toString() == '200') {
          return result = "true";
        } else if (value.statusCode.toString() == '401') {
          token = await getToken();
          loginUser(user);
          return result = "true";
        }
      },
    );
    return result;
  }
}
