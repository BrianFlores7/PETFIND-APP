class Pet {
  late String name;
  late String race;
  late String birthDate;
  late String gender;
  // late List<String> petImage;
  late String petImage;
  late String owner;
  late String description;

  Pet(
    this.name,
    this.race,
    this.birthDate,
    this.gender,
    this.petImage,
    this.owner,
    this.description,
  );
    Pet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    race = json['race'];
    birthDate = json['birthdate'];
    gender = json['gender'];
    description = json['description'];
    petImage = json['image_url'];
  }
}
