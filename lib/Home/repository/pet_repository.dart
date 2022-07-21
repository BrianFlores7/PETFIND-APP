import 'package:petfind/Home/model/user_request.dart';
import 'package:petfind/model/pet_model.dart';

abstract class Repository {
  // Future<List<Pet>> getPetList();
  Future<Map<String, dynamic>> getPetList();
  Future<List<RequestPetModel>> getRequestedList();
  Future<String> deleteRequest(RequestPetModel request); 
}
