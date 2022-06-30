class SignInModel {
  String? email;
  String? password;
  String? user;

  SignInModel(this.email, this.password, this.user);

  SignInModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    user = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['username'] = user;
    return data;
  }
}
