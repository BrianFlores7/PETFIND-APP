import 'package:petfind/Home/repository/pet_repository.dart';
import 'package:petfind/model/pet_model.dart';

class ListPetController {
  final Repository _repository;

  ListPetController(this._repository);

  Future<List<Pet>> fetchListPet() async {
    return _repository.getPetList();
  }
}
