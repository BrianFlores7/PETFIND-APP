import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petfind/Home/repository/pet_repository.dart';
import 'package:petfind/model/pet_model.dart';

class ListPetRepository implements Repository {
  static const String URL = "http://10.0.2.2:8000/get_all";
  Uri url = Uri.parse(URL);
  @override
  Future<List<Pet>> getPetList() async {
    List<Pet> listPets = [];

    final respuesta = await http.get(url);
    var info = json.decode(respuesta.body);
    for (var item = 0; item < info.length; item++) {
      listPets.add(Pet.fromJson(info[item]));
    }
    return listPets;
  }
}
