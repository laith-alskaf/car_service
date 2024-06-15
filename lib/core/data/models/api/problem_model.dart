class ProblemModel {
  String? problemType;
  String? name;
  String? image;
  int? price;
  int? duration;
  String? sId;
  int? iV;

  ProblemModel(
      {this.problemType,
      this.name,
      this.image,
      this.price,
      this.duration,
      this.sId,
      this.iV});

  ProblemModel.fromJson(Map<String, dynamic> json) {
    problemType = json['ProblemType'];
    name = json['Name'];
    image = json['image'];
    price = json['Price'];
    duration = json['duration'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProblemType'] = problemType;
    data['Name'] = name;
    data['image'] = image;
    data['Price'] = price;
    data['duration'] = duration;
    data['_id'] = sId;
    data['__v'] = iV;
    return data;
  }
}
class OrderDetailsModel {
  String? location;
  String? problem;
  int? estimatedTime;
  int? price;
  String? image;

  OrderDetailsModel(
      {this.location,
        this.problem,
        this.estimatedTime,
        this.price,
        this.image});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    location = json['Location'];
    problem = json['Problem'];
    estimatedTime = json['EstimatedTime'];
    price = json['Price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['Location'] = location;
    data['Problem'] = problem;
    data['EstimatedTime'] = estimatedTime;
    data['Price'] = price;
    data['image'] = image;
    return data;
  }
}
