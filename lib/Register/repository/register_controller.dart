import '../model/sign_in.dart';
import 'register_repository.dart';

class RegisterController {
  final RegisterRepository _repository;

  RegisterController(this._repository);

  Future<String> signIn(SignInModel user) async {
    return _repository.signInUser(user);
  }
}