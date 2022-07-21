import '../model/login.dart';
import 'login_repository.dart';

class LoginController {
  final LoginRepository _repository;

  LoginController(this._repository);

  Future<Map<String, String>> login(LoginModel user) async {
    return _repository.loginUser(user);
  }
}