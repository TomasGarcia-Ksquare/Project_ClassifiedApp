class FetchUserModel {
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? imgURL;
  String? date;
  int? iV;

  FetchUserModel(
      {this.sId,
      this.name,
      this.email,
      this.mobile,
      this.imgURL,
      this.date,
      this.iV});

  FetchUserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    mobile = json['mobile'] ?? '';
    imgURL = json['imgURL'] ??
        'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png';
    date = json['date'] ?? '';
    iV = json['__v'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['imgURL'] = this.imgURL;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
