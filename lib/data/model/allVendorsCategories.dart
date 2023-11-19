class VendorCategoryModel {
  List<VendorCategory> data;
  Links links;
  Meta meta;

  VendorCategoryModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory VendorCategoryModel.fromJson(Map<String, dynamic> json) {
    return VendorCategoryModel(
      data: List<VendorCategory>.from(
        json['data'].map((category) => VendorCategory.fromJson(category)),
      ),
      links: Links.fromJson(json['links']),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class VendorCategory {
  String name;
  String langId;

  VendorCategory({
    required this.name,
    required this.langId,
  });

  factory VendorCategory.fromJson(Map<String, dynamic> json) {
    return VendorCategory(
      name: json['name'],
      langId: json['lang_id'],
    );
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      links: List<Link>.from(json['links'].map((link) => Link.fromJson(link))),
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}