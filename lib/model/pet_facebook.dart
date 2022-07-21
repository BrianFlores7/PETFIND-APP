class PetFacebookModel {
  int id = 0;
  String post = '';
  String imageUrl = '';
  String postUrl = '';

  PetFacebookModel(
    this.id,
    this.post,
    this.imageUrl,
    this.postUrl,
  );

  PetFacebookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    post = json['post'];
    imageUrl = json['image_url'];
    postUrl = json['post_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post'] = this.post;
    data['image_url'] = this.imageUrl;
    data['post_url'] = this.postUrl;
    return data;
  }
}
