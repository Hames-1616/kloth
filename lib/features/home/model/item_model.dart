class Items {

  String? name;
  int? price;

  Items({

     this.name, this.price});

  Items.fromJson(Map<String, dynamic> json) {
 
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
   
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
