class AllVendorCategoryModel {
  Data? data;

  AllVendorCategoryModel({this.data});

  AllVendorCategoryModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? langId;
  List<Vendors>? vendors;

  Data({this.id, this.name, this.langId, this.vendors});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    langId = json['lang_id'];
    if (json['vendors'] != null) {
      vendors = <Vendors>[];
      json['vendors'].forEach((v) {
        vendors!.add(new Vendors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lang_id'] = this.langId;
    if (this.vendors != null) {
      data['vendors'] = this.vendors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vendors {
  int? id;
  String? name;
  String? lang;
  String? phone;
  String? mobile;
  String? deliveryCharge;
  String? deliveryTime;
  int? rating;
  String? description;
  String? address;
  String? createdAt;
  String? updatedAt;
  List<Media>? media;

  Vendors(
      {this.id,
        this.name,
        this.lang,
        this.phone,
        this.mobile,
        this.deliveryCharge,
        this.deliveryTime,
        this.rating,
        this.description,
        this.address,
        this.createdAt,
        this.updatedAt,
        this.media});

  Vendors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lang = json['lang'];
    phone = json['phone'];
    mobile = json['mobile'];
    deliveryCharge = json['delivery_charge'];
    deliveryTime = json['delivery_time'];
    rating = json['rating'];
    description = json['description'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lang'] = this.lang;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['delivery_charge'] = this.deliveryCharge;
    data['delivery_time'] = this.deliveryTime;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  int? id;
  String? name;
  String? description;
  String? path;
  String? type;
  int? order;
  bool? isMain;
  int? size;
  String? createdAt;
  String? updatedAt;

  Media(
      {this.id,
        this.name,
        this.description,
        this.path,
        this.type,
        this.order,
        this.isMain,
        this.size,
        this.createdAt,
        this.updatedAt});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    path = json['path'];
    type = json['type'];
    order = json['order'];
    isMain = json['is_main'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['path'] = this.path;
    data['type'] = this.type;
    data['order'] = this.order;
    data['is_main'] = this.isMain;
    data['size'] = this.size;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}