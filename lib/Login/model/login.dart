class LoginModel {
  String? email;
  String? password;

  LoginModel(this.email, this.password);

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = email;
    data['password'] = password;
    return data;
  }
}
