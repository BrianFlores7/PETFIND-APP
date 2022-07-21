class PetBackModel {
  late int id;
  late String name;
  late String race;
  late String birthdate;
  late int age;
  late String gender;
  late String description;
  late String location;
  late String imageUrl;
  late int ownerId;

  PetBackModel(
      this.id,
      this.name,
      this.race,
      this.birthdate,
      this.age,
      this.gender,
      this.description,
      this.location,
      this.imageUrl,
      this.ownerId);

  PetBackModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    race = json['race'];
    birthdate = json['birthdate'];
    age = json['age'];
    gender = json['gender'];
    description = json['description'];
    location = json['location'];
    imageUrl = json['image_url'];
    ownerId = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['race'] = this.race;
    data['birthdate'] = this.birthdate;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['description'] = this.description;
    data['location'] = this.location;
    data['image_url'] = this.imageUrl;
    data['owner_id'] = this.ownerId;
    return data;
  }
}
