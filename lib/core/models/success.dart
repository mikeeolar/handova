// To parse this JSON data, do
//
//     final success = successFromJson(jsonString);

import 'dart:convert';

Success successFromJson(String str) => Success.fromJson(json.decode(str));

String successToJson(Success data) => json.encode(data.toJson());

class Success {
  Success({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.email,
    this.name,
  });

  String? email;
  String? name;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
      };
}
