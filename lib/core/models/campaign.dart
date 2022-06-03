// To parse this JSON data, do
//
//     final campaign = campaignFromJson(jsonString);

import 'dart:convert';

Campaign campaignFromJson(String str) => Campaign.fromJson(json.decode(str));

String campaignToJson(Campaign data) => json.encode(data.toJson());

class Campaign {
  Campaign({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
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
    this.totalDocuments,
    this.totalPages,
    this.currentPage,
    this.nextPage,
    this.prevPage,
    this.data,
  });

  int? totalDocuments;
  int? totalPages;
  int? currentPage;
  dynamic nextPage;
  dynamic prevPage;
  List<Datum>? data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalDocuments: json["totalDocuments"],
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
        nextPage: json["nextPage"],
        prevPage: json["prevPage"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalDocuments": totalDocuments,
        "totalPages": totalPages,
        "currentPage": currentPage,
        "nextPage": nextPage,
        "prevPage": prevPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.createdBy,
    this.name,
    this.target,
    this.balance,
    this.beneficiary,
    this.status,
    this.category,
    this.targetDate,
    this.imageUrls,
    this.isDraft,
    this.donationProposalDoc,
    this.medicalDoc,
    this.description,
    this.fundRaisingFor,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? createdBy;
  String? name;
  int? target;
  int? balance;
  String? beneficiary;
  String? status;
  String? category;
  DateTime? targetDate;
  List<String>? imageUrls;
  bool? isDraft;
  String? donationProposalDoc;
  String? medicalDoc;
  String? description;
  String? fundRaisingFor;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        createdBy: json["createdBy"],
        name: json["name"],
        target: json["target"],
        balance: json["balance"],
        beneficiary: json["beneficiary"],
        status: json["status"],
        category: json["category"],
        targetDate: DateTime.parse(json["targetDate"]),
        imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
        isDraft: json["isDraft"],
        donationProposalDoc: json["donationProposalDoc"],
        medicalDoc: json["medicalDoc"],
        description: json["description"],
        fundRaisingFor: json["fundRaisingFor"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "createdBy": createdBy,
        "name": name,
        "target": target,
        "balance": balance,
        "beneficiary": beneficiary,
        "status": status,
        "category": category,
        "targetDate": targetDate!.toIso8601String(),
        "imageUrls": List<dynamic>.from(imageUrls!.map((x) => x)),
        "isDraft": isDraft,
        "donationProposalDoc": donationProposalDoc,
        "medicalDoc": medicalDoc,
        "description": description,
        "fundRaisingFor": fundRaisingFor,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
