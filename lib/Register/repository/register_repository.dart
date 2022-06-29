import '../model/sign_in.dart';

abstract class RegisterRepository{
  Future<String> signInUser(SignInModel user);
}