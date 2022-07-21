import 'package:petfind/Home/model/request_info.dart';
import 'package:petfind/Home/model/user_request.dart';
import 'package:petfind/Home/repository/pet_repository.dart';
import 'package:petfind/model/pet_model.dart';
import 'package:petfind/model/pet_model_back.dart';

class ListPetController {
  final Repository _repository;

  ListPetController(this._repository);

  // Future<List<Pet>> fetchListPet() async {
  //   return _repository.getPetList();
  // }

  Future<Map<String, dynamic>> fetchListPet() async {
    return _repository.getPetList();
  }

  Future<List<RequestPetModelInfoWithOwner>> fetchListRequested(String userId) async {
    return _repository.getRequestedList(userId);
  }

  Future<String> deleteRequest(RequestPetModel request) async {
    return _repository.deleteRequest(request);
  }

  Future<String> adopt (PetBackModel pet, String userId) async {
    return _repository.adopt(pet, userId);
  }
}
