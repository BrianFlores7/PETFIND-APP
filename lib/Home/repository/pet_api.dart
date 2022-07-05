import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petfind/Home/repository/pet_repository.dart';
import 'package:petfind/model/pet_model.dart';

class ListPetRepository implements Repository {
  @override
  Future<List<Pet>> getPetList() async {
    List<Pet> listPets = [];
    Pet pet = Pet(
      'Boby',
      'Chihuahua',
      '6 años',
      'M',
      'https://www.advancedsciencenews.com/wp-content/uploads/2022/05/sniffer-dog-covid-19.png',
      'Brian',
    );
    for (var i = 0; i < 6; i++) {
      listPets.add(pet);
    }
    return listPets;
  }
}
