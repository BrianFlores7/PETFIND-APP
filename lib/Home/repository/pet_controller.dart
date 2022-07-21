import 'package:petfind/Home/model/user_request.dart';
import 'package:petfind/Home/repository/pet_repository.dart';
import 'package:petfind/model/pet_model.dart';

class ListPetController {
  final Repository _repository;

  ListPetController(this._repository);

  // Future<List<Pet>> fetchListPet() async {
  //   return _repository.getPetList();
  // }

  Future<Map<String, dynamic>> fetchListPet() async {
    return _repository.getPetList();
  }

  Future<List<RequestPetModel>> fetchListRequested() async {
    return _repository.getRequestedList();
  }

  Future<String> deleteRequest(RequestPetModel request) async {
    return _repository.deleteRequest(request);
  }
}
