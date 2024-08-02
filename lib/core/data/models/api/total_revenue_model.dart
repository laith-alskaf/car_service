class TotalRevenue {
  String? parkName;
  int? totalRevenue;

  TotalRevenue({this.parkName, this.totalRevenue});

  TotalRevenue.fromJson(Map<String, dynamic> json) {
    parkName = json['ParkName'];
    totalRevenue = json['totalRevenue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ParkName'] = this.parkName;
    data['totalRevenue'] = this.totalRevenue;
    return data;
  }
}
