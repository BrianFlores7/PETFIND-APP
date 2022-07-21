import '../model/login.dart';

abstract class LoginRepository{
  Future<Map<String, String>> loginUser(LoginModel user);
}