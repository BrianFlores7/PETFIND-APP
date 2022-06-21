class SignInModel {
  String? email;
  String? password;
  String? phone;

  SignInModel(this.email, this.password, this.phone);

  SignInModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    return data;
  }
}
