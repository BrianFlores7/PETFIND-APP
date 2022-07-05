import 'package:petfind/model/pet_model.dart';

abstract class Repository {
  Future<List<Pet>> getPetList();
}
