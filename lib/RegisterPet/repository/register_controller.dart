

import 'package:petfind/RegisterPet/repository/register_repository.dart';
import 'package:petfind/model/pet_model.dart';

class RegisterController {
  final RegisterPetRepository _repository;

  RegisterController(this._repository);

  Future<String> registerPet(Pet pet) async {
    return _repository.registerPet(pet);
  }
}