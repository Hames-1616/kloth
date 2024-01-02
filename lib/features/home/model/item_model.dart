class Items {
  String? name;
  int? price;
  String? info;

  Items({this.name, this.price, this.info});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['price'] = this.price;
    data['info'] = this.info;
    return data;
  }
}
