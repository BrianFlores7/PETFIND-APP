import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/login.dart';
import 'login_repository.dart';

class LoginApiRepository implements LoginRepository {
  static const String URL = "http://login-lb-1665102379.us-east-1.elb.amazonaws.com/login";

  @override
  Future<Map<String,String>> loginUser(LoginModel user) async {
    Map<String, String> result = {
      "result" : "false"
    };
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
          result.clear();
          result = {
            "result" : "true",
            "user_id" : status["user_id"],
          };
          return result;
        }
      },
    );
    return result;
  }
}
