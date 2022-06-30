import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/login.dart';
import 'login_repository.dart';

class LoginApiRepository implements LoginRepository {
  static const String URL = "http://10.0.2.2:3000/api/login";

  @override
  Future<String> loginUser(LoginModel user) async {
    var result = 'false';
    // print("En API ${user.email} ${user.password}");
    Map data = {
      'username': user.email,
      'password': user.password,
    };

    //
    String jsonObject = json.encode(data);
    var response = await http
        .post(
      Uri.parse(URL),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      encoding: Encoding.getByName("utf-8"),
      body: jsonObject,
    )
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
