import '../model/login.dart';

abstract class LoginRepository{
  Future<String> loginUser(LoginModel user);
}