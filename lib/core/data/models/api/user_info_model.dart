
class UserInfo {
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
  int? money;
  int? paymentAmount;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserInfo(
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
        this.money,
        this.paymentAmount,
        this.createdAt,
        this.updatedAt,
        this.iV});

  UserInfo.fromJson(Map<String, dynamic> json) {
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
    money = json['money'];
    paymentAmount = json['paymentAmount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['username'] = username;
    data['emailVerified'] = emailVerified;
    data['photo'] = photo;
    data['role'] = role;
    data['expirationCodeTime'] = expirationCodeTime;
    data['verifyEmailCode'] = verifyEmailCode;
    data['resetPasswordCode'] = resetPasswordCode;
    data['money'] = money;
    data['paymentAmount'] = paymentAmount;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
