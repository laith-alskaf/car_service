class UpdateModel {
  String? orderId;
  int? price;
  String? date;

  UpdateModel({this.orderId, this.price, this.date});

  UpdateModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    price = json['price'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['price'] = this.price;
    data['date'] = this.date;
    return data;
  }
}