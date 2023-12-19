// To parse this JSON data, do
//
//     final SurahModel = SurahModelFromJson(jsonString);

import 'dart:convert';

SurahModel SurahModelFromJson(String str) =>
    SurahModel.fromJson(json.decode(str));

String quranToJson(SurahModel data) => json.encode(data.toJson());

class SurahModel {
  Surahs surahs;

  SurahModel({
    required this.surahs,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        surahs: Surahs.fromJson(json["surahs"]),
      );

  Map<String, dynamic> toJson() => {
        "surahs": surahs.toJson(),
      };
}

class Surahs {
  int count;
  List<Reference> references;

  Surahs({
    required this.count,
    required this.references,
  });

  factory Surahs.fromJson(Map<String, dynamic> json) => Surahs(
        count: json["count"],
        references: List<Reference>.from(
            json["references"].map((x) => Reference.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "references": List<dynamic>.from(references.map((x) => x.toJson())),
      };
}

class Reference {
  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  int numberOfAyahs;
  String revelationType;

  Reference({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        numberOfAyahs: json["numberOfAyahs"],
        revelationType: json["revelationType"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "numberOfAyahs": numberOfAyahs,
        "revelationType": revelationType,
      };
}
