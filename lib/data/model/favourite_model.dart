class FavouriteModel {
  List<Data>? data;

  FavouriteModel({this.data});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? lang;
  int? price;
  int? discountPrice;
  bool? featured;
  String? yourChoice;
  String? currency;

  Data(
      {this.id,
        this.name,
        this.description,
        this.lang,
        this.price,
        this.discountPrice,
        this.featured,
        this.yourChoice,
        this.currency});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    lang = json['lang'];
    price = json['price'];
    discountPrice = json['discount_price'];
    featured = json['featured'];
    yourChoice = json['your_choice'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['lang'] = this.lang;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['featured'] = this.featured;
    data['your_choice'] = this.yourChoice;
    data['currency'] = this.currency;
    return data;
  }
}