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
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['parkNumber'] = parkNumber;
    data['filled'] = filled;
    data['carNumber'] = carNumber;
    data['bookingEndTime'] = bookingEndTime;
    data['_id'] = sId;
    return data;
  }
}
