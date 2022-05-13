import 'dart:convert';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.uid,
    this.name,
    this.phone,
    this.keyName,
    this.email,
    this.creationTime,
    this.lastSignInTime,
    this.registerTime,
    this.photoUrl,
    this.status,
    this.updatedTime,
  });

  String? uid;
  String? name;
  int? phone;
  String? keyName;
  String? email;
  String? creationTime;
  String? lastSignInTime;
  String? registerTime;
  String? photoUrl;
  String? status;
  String? updatedTime;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        uid: json["uid"],
        name: json["name"],
        phone: json["phone"],
        keyName: json["keyName"],
        email: json["email"],
        creationTime: json["creationTime"],
        lastSignInTime: json["lastSignInTime"],
        registerTime: json["registerTime"],
        photoUrl: json["photoUrl"],
        status: json["status"],
        updatedTime: json["updatedTime"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "phone": phone,
        "keyName": keyName,
        "email": email,
        "creationTime": creationTime,
        "lastSignInTime": lastSignInTime,
        "registerTime": registerTime,
        "photoUrl": photoUrl,
        "status": status,
        "updatedTime": updatedTime,
      };
}
