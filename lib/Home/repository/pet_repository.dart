import 'package:petfind/Home/model/request_info.dart';
import 'package:petfind/Home/model/user_request.dart';
import 'package:petfind/model/pet_model.dart';
import 'package:petfind/model/pet_model_back.dart';

abstract class Repository {
  // Future<List<Pet>> getPetList();
  Future<Map<String, dynamic>> getPetList();
  Future<String> adopt(PetBackModel pet, String userId);
  Future<List<RequestPetModelInfoWithOwner>> getRequestedList(String userId);
  Future<String> deleteRequest(RequestPetModel request); 
}
