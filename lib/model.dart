// To parse this JSON data, do
//
//     final poc = pocFromJson(jsonString);

import 'dart:convert';

Poc pocFromJson(String str) => Poc.fromJson(json.decode(str));

String pocToJson(Poc data) => json.encode(data.toJson());

class Poc {
  Poc({
    this.data,
  });

  List<Datum>? data;

  factory Poc.fromJson(Map<String, dynamic> json) => Poc(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.name,
    this.image,
    this.id,
  });

  String? name;
  String? image;
  String? id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "id": id,
      };
}
