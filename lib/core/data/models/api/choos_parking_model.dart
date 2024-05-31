class ChooseParkingModel {
  LocationPark? location;
  String? sId;
  String? parkingName;
  int? parkingNumber;

  ChooseParkingModel(
      {this.location, this.sId, this.parkingName, this.parkingNumber});

  ChooseParkingModel.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? LocationPark.fromJson(json['location']) : null;
    sId = json['_id'];

    parkingName = json['parkingName'];
    parkingNumber = json['parkingNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['_id'] = sId;

    data['parkingName'] = parkingName;
    data['parkingNumber'] = parkingNumber;
    return data;
  }
}

class LocationPark {
  List<double>? coordinates;
  String? type;
  String? parkingName;
  int? parkingNumber;

  LocationPark({this.coordinates, this.type, this.parkingName, this.parkingNumber});

  LocationPark.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
    parkingName = json['parkingName'];
    parkingNumber = json['parkingNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coordinates'] = coordinates;
    data['type'] = type;
    data['parkingName'] = parkingName;
    data['parkingNumber'] = parkingNumber;
    return data;
  }
}
