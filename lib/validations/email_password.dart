bool validateEmail(String email) {
  bool isValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  return isValid;
}

bool validatePassword(String password) {
  bool isValid =
      RegExp(r"^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$").hasMatch(password);
  return isValid;
}