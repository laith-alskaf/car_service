class ProModel {
  List<String>? pro;

  ProModel({this.pro});

  ProModel.fromJson(Map<String, dynamic> json) {
    pro = json['pro'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pro'] = this.pro;
    return data;
  }
}