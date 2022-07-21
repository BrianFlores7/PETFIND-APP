class RequestPetModel {
  String id = '';
  String name= '';
  String location= '';
  String date= '';


  RequestPetModel(this.id, this.name, this.location, this.date,);

  RequestPetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['date'] = this.date;
    return data;
  }
}

