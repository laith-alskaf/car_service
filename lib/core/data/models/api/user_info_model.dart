class UserInfo {
  User? user;

  UserInfo({this.user});

  UserInfo.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? username;
  bool? emailVerified;
  String? photo;
  String? role;
  String? expirationCodeTime;
  String? verifyEmailCode;
  String? resetPasswordCode;
  Null? resetPasswordExpiration;
  int? money;
  int? paymentAmount;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
        this.email,
        this.password,
        this.firstName,
        this.lastName,
        this.username,
        this.emailVerified,
        this.photo,
        this.role,
        this.expirationCodeTime,
        this.verifyEmailCode,
        this.resetPasswordCode,
        this.resetPasswordExpiration,
        this.money,
        this.paymentAmount,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    emailVerified = json['emailVerified'];
    photo = json['photo'];
    role = json['role'];
    expirationCodeTime = json['expirationCodeTime'];
    verifyEmailCode = json['verifyEmailCode'];
    resetPasswordCode = json['resetPasswordCode'];
    resetPasswordExpiration = json['resetPasswordExpiration'];
    money = json['money'];
    paymentAmount = json['paymentAmount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['username'] = this.username;
    data['emailVerified'] = this.emailVerified;
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['expirationCodeTime'] = this.expirationCodeTime;
    data['verifyEmailCode'] = this.verifyEmailCode;
    data['resetPasswordCode'] = this.resetPasswordCode;
    data['resetPasswordExpiration'] = this.resetPasswordExpiration;
    data['money'] = this.money;
    data['paymentAmount'] = this.paymentAmount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
