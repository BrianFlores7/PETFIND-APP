import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petfind/model/pet_model.dart';
import 'register_repository.dart';

class RegisterApiPetRepository implements RegisterPetRepository {
  static const String URL = "http://10.0.2.2:8000/create";
  String token = "";

  @override
  Future<String> registerPet(Pet pet) async {
    
    var result = 'false';
    Map data = {
      "name": pet.name,
      "race": pet.race,
      "birthdate": pet.birthDate,
      "gender": pet.gender,
      "description": pet.description,
      "location": "Tuxtla Gutierrez",
      "image_url":
          "https://www.fundacion-affinity.org/sites/default/files/los-10-sonidos-principales-del-perro.jpg"
    };
    String jsonObject = json.encode(data);

    await http
        .post(Uri.parse(URL),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            encoding: Encoding.getByName("utf-8"),
            body: jsonObject)
        .then(
      (value) async {
        var status = jsonDecode(value.body);
        if (status['status'] != 'error') {
          return result = "true";
        }
      },
    );

    return result;
  }
}
