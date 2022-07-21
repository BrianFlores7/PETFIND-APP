import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petfind/Home/model/user_request.dart';
import 'package:petfind/Home/repository/pet_repository.dart';
import 'package:petfind/model/pet_facebook.dart';
import 'package:petfind/model/pet_model.dart';

class ListPetRepository implements Repository {
  static const String URL = "http://10.0.2.2:8000/get_all";
  Uri url = Uri.parse(URL);
  @override
  Future<Map<String, dynamic>> getPetList() async {
    List<Pet> listPets = [];
    List<PetFacebookModel> listPetsFacebook = [];

    // final respuesta = await http.get(url);
    // var info = json.decode(respuesta.body);
    // for (var item = 0; item < info.length; item++) {
    //   listPets.add(Pet.fromJson(info[item]));
    // }
    final respuestaFacebook = await http.get(
      Uri.parse('http://auth-lb-310470202.us-east-1.elb.amazonaws.com/get_all'),
      headers: {
        'Content-type': 'application/json; charset=utf-8',
      },
    );
    var infoFacebook = json.decode(utf8.decode(respuestaFacebook.bodyBytes));
    for (var item = 0; item < infoFacebook.length; item++) {
      listPetsFacebook.add(PetFacebookModel.fromJson(infoFacebook[item]));
    }
    Map<String, dynamic> data = {
      "petFromApp": listPets,
      "petFromFacebook": listPetsFacebook,
    };
    return data;
  }

  List<RequestPetModel> listPets = [
    RequestPetModel(
      '0',
      'Brian',
      'Ocozocoautla',
      '05/06/2022',
    ),
    RequestPetModel(
      '1',
      'Brian',
      'Ocozocoautla',
      '05/06/2022',
    ),
    RequestPetModel(
      '2',
      'Brian',
      'Ocozocoautla',
      '05/06/2022',
    ),
  ];

  @override
  Future<List<RequestPetModel>> getRequestedList() async {
    return listPets;
  }

  @override
  Future<String> deleteRequest(RequestPetModel request) async {
    for (var i = 0; i < listPets.length; i++) {
      if (listPets[i].id == request.id) {
        listPets.remove(i);
        return 'Delete it';
      }
    }

    return 'Internal Error';
  }
}
