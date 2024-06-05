class ParkingSpot {
  int? parkNumber;
  bool? filled;
  String? carNumber;
  String? bookingEndTime;
  String? sId;

  ParkingSpot(
      {this.parkNumber,
        this.filled,
        this.carNumber,
        this.bookingEndTime,
        this.sId});

  ParkingSpot.fromJson(Map<String, dynamic> json) {
    parkNumber = json['parkNumber'];
    filled = json['filled'];
    carNumber = json['carNumber'];
    bookingEndTime = json['bookingEndTime'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parkNumber'] = this.parkNumber;
    data['filled'] = this.filled;
    data['carNumber'] = this.carNumber;
    data['bookingEndTime'] = this.bookingEndTime;
    data['_id'] = this.sId;
    return data;
  }
}
