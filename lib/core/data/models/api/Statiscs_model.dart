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
class NumberofLocationbyPark {
  int? total;
  int? month;

  NumberofLocationbyPark({this.total, this.month});

  NumberofLocationbyPark.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['month'] = this.month;
    return data;
  }
}
class TotalRevenueByPark {
  int? totalRevenue;
  int? month;

  TotalRevenueByPark({this.totalRevenue, this.month});

  TotalRevenueByPark.fromJson(Map<String, dynamic> json) {
    totalRevenue = json['totalRevenue'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalRevenue'] = this.totalRevenue;
    data['month'] = this.month;
    return data;
  }
}
class RepairOrdersByproblem {
  String? sId;
  int? total;

  RepairOrdersByproblem({this.sId, this.total});

  RepairOrdersByproblem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['total'] = this.total;
    return data;
  }
}
