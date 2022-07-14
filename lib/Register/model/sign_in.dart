class SignInModel {
  String? email;
  String? password;
  String? user;
  String? name;
  String? address;
  String? colonia;
  String? postal_code;
  String? phone;

  SignInModel(
    this.email,
    this.password,
    this.user,
    this.name,
    this.address,
    this.colonia,
    this.postal_code,
    this.phone,
  );

  SignInModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    user = json['username'];
    name = json['name'];
    address = json['address'];
    colonia = json['colonia'];
    postal_code = json['codigo_postal'];
    phone = json['phone'];
  }
}
