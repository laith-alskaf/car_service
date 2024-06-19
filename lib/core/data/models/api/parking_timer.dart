class ParkingTimer {
  int? hours;
  int? minutes;
  int? seconds;

  ParkingTimer({this.hours, this.minutes, this.seconds});

  ParkingTimer.fromJson(Map<String, dynamic> json) {
    hours = json['hours'];
    minutes = json['minutes'];
    seconds = json['seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hours'] = this.hours;
    data['minutes'] = this.minutes;
    data['seconds'] = this.seconds;
    return data;
  }
}