import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../token/get_token.dart';
import '../model/sign_in.dart';
import 'register_repository.dart';

class RegisterApiRepository implements RegisterRepository {
  static const String URL =
      "http://login-lb-1665102379.us-east-1.elb.amazonaws.com/create";
  String token = "";

  @override
  Future<String> signInUser(SignInModel user) async {
    var result = 'false';

    Map data = {
      "username": user.username,
      "password": user.password,
      "email": user.email,
      "fullname": user.fullname,
      "direction": user.direction,
      "colony": user.colony,
      "postal_code": user.postalCode,
      "phone": user.phone,
      "ine_image_url": user.ineImageUrl,
    };

    String jsonObject = json.encode(data);
    await http
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
