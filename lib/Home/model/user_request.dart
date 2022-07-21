class RequestPetModel {
  late int id;
  late int idOwner;
  late int idPet;
  late int idUser;
  late String status;
  late String date;

  RequestPetModel(
    this.id,
    this.idOwner,
    this.idPet,
    this.idUser,
    this.status,
    this.date,
  );

  RequestPetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idOwner = json['id_owner'];
    idPet = json['id_pet'];
    idUser = json['id_user'];
    status = json['status'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_owner'] = this.idOwner;
    data['id_pet'] = this.idPet;
    data['id_user'] = this.idUser;
    data['status'] = this.status;
    data['date'] = this.date;
    return data;
  }
}
