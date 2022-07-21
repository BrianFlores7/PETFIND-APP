class SignInModel {
  String? username;
  String? password;
  String? email;
  String? fullname;
  String? direction;
  String? colony;
  String? postalCode;
  String? phone;
  String? ineImageUrl;

  SignInModel(
      this.username,
      this.password,
      this.email,
      this.fullname,
      this.direction,
      this.colony,
      this.postalCode,
      this.phone,
      this.ineImageUrl);

  SignInModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    fullname = json['fullname'];
    direction = json['direction'];
    colony = json['colony'];
    postalCode = json['postal_code'];
    phone = json['phone'];
    ineImageUrl = json['ine_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    data['fullname'] = fullname;
    data['direction'] = direction;
    data['colony'] = colony;
    data['postal_code'] = postalCode;
    data['phone'] = phone;
    data['ine_image_url'] = ineImageUrl;
    return data;
  }
}
