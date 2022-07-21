class Pet {
  late String name;
  late String race;
  late String birthDate;
  late String description;
  late String gender;
  // late List<String> petImage;
  late String petImage;
  late String owner;

  Pet(
    this.name,
    this.race,
    this.birthDate,
    this.description,
    this.gender,
    this.petImage,
    this.owner, 
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
