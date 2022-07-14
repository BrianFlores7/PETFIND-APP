import 'package:petfind/model/pet_model.dart';

abstract class RegisterPetRepository {
  Future<String> registerPet(Pet pet);
}
