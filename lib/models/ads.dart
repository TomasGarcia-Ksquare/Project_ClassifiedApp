class AdsModel {
  String? sId;
  String? title;
  String? description;
  num? price;
  List<String>? images;
  String? authorName;
  String? userId;
  String? mobile;
  String? createdAt;
  int? iV;

  AdsModel(
      {this.sId,
      this.title,
      this.description,
      this.price,
      this.images,
      this.authorName,
      this.userId,
      this.mobile,
      this.createdAt,
      this.iV});

  AdsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    title = json['title'] ?? '';
    description = json['description'] ?? ''; //default value
    price = json['price'] ?? '';
    images = List<String>.from(json['images'] ??
        [
          'https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png'
        ]);
    authorName = json['authorName'] ?? '';
    userId = json['userId'] ?? '';
    mobile = json['mobile'] ?? '';
    createdAt = json['createdAt'] ?? '';
    iV = json['__v'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['images'] = images;
    data['authorName'] = authorName;
    data['userId'] = userId;
    data['mobile'] = mobile;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}
