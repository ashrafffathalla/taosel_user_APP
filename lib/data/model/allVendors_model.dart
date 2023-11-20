class AllVendorsModel {
  List<Data>? data;

  AllVendorsModel({this.data,});

  AllVendorsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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

  Data(
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
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['lang'] = lang;
    data['phone'] = phone;
    data['mobile'] = mobile;
    data['delivery_charge'] = deliveryCharge;
    data['delivery_time'] = deliveryTime;
    data['rating'] = rating;
    data['description'] = description;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

