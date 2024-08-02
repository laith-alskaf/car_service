class CountAllParkModel {
  String? sId;
  int? total;
  String? parkName;

  CountAllParkModel({this.sId, this.total, this.parkName});

  CountAllParkModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    total = json['total'];
    parkName = json['parkName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['total'] = this.total;
    data['parkName'] = this.parkName;
    return data;
  }
}
