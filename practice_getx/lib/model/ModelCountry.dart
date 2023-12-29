import 'dart:convert';

ModelCountry modelCountryFromJson(String str) => ModelCountry.fromJson(json.decode(str));

String modelCountryToJson(ModelCountry data) => json.encode(data.toJson());

class ModelCountry {
  bool error;
  String msg;
  List<Datum> data;

  ModelCountry({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory ModelCountry.fromJson(Map<String, dynamic> json) => ModelCountry(
    error: json["error"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String iso2;
  String iso3;
  String country;

  Datum({
    required this.iso2,
    required this.iso3,
    required this.country,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    iso2: json["iso2"],
    iso3: json["iso3"],
    country: json["country"],

  );

  Map<String, dynamic> toJson() => {
    "iso2": iso2,
    "iso3": iso3,
    "country": country,

  };
}
