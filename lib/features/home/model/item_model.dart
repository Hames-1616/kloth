class Items {
  String? name;
  int? price;
  String? info;
  bool? liked;

  Items({this.name, this.price, this.info, this.liked});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    info = json['info'];
    liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['price'] = this.price;
    data['info'] = this.info;
    data['liked'] = this.liked;
    return data;
  }
}
