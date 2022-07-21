import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:petfind/Home/model/request_info.dart';
import 'package:petfind/Home/model/user_request.dart';
import 'package:petfind/Home/repository/pet_repository.dart';
import 'package:petfind/model/pet_facebook.dart';
import 'package:petfind/model/pet_model.dart';
import 'package:petfind/model/pet_model_back.dart';

class ListPetRepository implements Repository {
  static const String URL =
      "http://adopt-lb-1178093871.us-east-1.elb.amazonaws.com";
  Uri url = Uri.parse(URL);
  @override
  Future<Map<String, dynamic>> getPetList() async {
    List<PetBackModel> listPets = [];
    List<PetFacebookModel> listPetsFacebook = [];

    final respuesta = await http.get(
      Uri.parse("http://pet-lb-766662489.us-east-1.elb.amazonaws.com/get_all"),
      headers: {
        'Content-type': 'application/json; charset=utf-8',
      },
    );
    var info = json.decode(utf8.decode(respuesta.bodyBytes));
    for (var item = 0; item < info.length; item++) {
      listPets.add(PetBackModel.fromJson(info[item]));
    }
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

  @override
  Future<List<RequestPetModelInfoWithOwner>> getRequestedList(String id) async {
    List<RequestPetModel> listPets = [];
    List<RequestPetModelInfoWithOwner> listData = [];
    final respuesta = await http.get(
      Uri.parse(
          "http://adopt-lb-1178093871.us-east-1.elb.amazonaws.com/get-owner-view/$id"),
      headers: {
        'Content-type': 'application/json; charset=utf-8',
      },
    );
    var info = json.decode(utf8.decode(respuesta.bodyBytes));
    final infoMascotToAdopt = [];
    final infoWannaAdopt = [];

    for (var i = 0; i < info.length; i++) {
      var response = await http.get(
        Uri.parse(
            'http://pet-lb-766662489.us-east-1.elb.amazonaws.com/get/${info[i]["id_pet"]}'),
      );
      infoMascotToAdopt.add(
        json.decode(
          utf8.decode(response.bodyBytes),
        ),
      );
    }

    for (var i = 0; i < info.length; i++) {
      var response = await http.get(
        Uri.parse(
            'http://login-lb-1665102379.us-east-1.elb.amazonaws.com/get/${info[i]["id_user"]}'),
      );
      infoWannaAdopt.add(
        json.decode(
          utf8.decode(response.bodyBytes),
        ),
      );
    }
    List<RequestPetModelInfoWithOwner> data = [];
    for (var item = 0; item < info.length; item++) {
      // listPets.add(RequestPetModel.fromJson(info[item]));
      data.add(
        RequestPetModelInfoWithOwner(
          infoWannaAdopt[item]["fullname"],
          infoMascotToAdopt[item]["name"],
          infoWannaAdopt[item]["phone"],
        ),
      );
    }

    return data;
  }

  @override
  Future<String> deleteRequest(RequestPetModel request) async {
    // for (var i = 0; i < listPets.length; i++) {
    //   if (listPets[i].id == request.id) {
    //     listPets.remove(i);
    //     return 'Delete it';
    //   }
    // }

    return 'Internal Error';
  }

  @override
  Future<String> adopt(PetBackModel pet, String userId) async {
    String result = 'false';
    Map data = {
      'id_owner': pet.ownerId,
      'id_pet': pet.id,
      'id_user': int.parse(userId),
      'status': 'In Progress',
      'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
    };

    //
    String jsonObject = json.encode(data);
    var response = await http
        .post(
      Uri.parse(
          'http://adopt-lb-1178093871.us-east-1.elb.amazonaws.com/create'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      encoding: Encoding.getByName("utf-8"),
      body: jsonObject,
    )
        .then(
      (value) async {
        var status = jsonDecode(value.body);
        if (status['status'] != 'error') {
          result = 'true';
          return result;
        }
      },
    );
    return result;
  }
}
