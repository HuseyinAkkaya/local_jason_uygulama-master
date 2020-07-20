// To parse this JSON data, do
//
//     final kategori = kategoriFromJson(jsonString);

import 'dart:convert';

Kategori kategoriFromJson(String str) => Kategori.fromJson(json.decode(str));

String kategoriToJson(Kategori data) => json.encode(data.toJson());

class Kategori {
  Kategori({
    this.exampleData,
  });

  List<ExampleDatum> exampleData;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        exampleData: json["example_data"] == null
            ? null
            : List<ExampleDatum>.from(
                json["example_data"].map((x) => ExampleDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "example_data": exampleData == null
            ? null
            : List<dynamic>.from(exampleData.map((x) => x.toJson())),
      };
}

class ExampleDatum {
  ExampleDatum({
    this.id,
    this.name,
    this.list,
  });

  String id;
  String name;
  List<ListElement> list;

  factory ExampleDatum.fromJson(Map<String, dynamic> json) => ExampleDatum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "list": list == null
            ? null
            : List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.id,
    this.type,
  });

  String id;
  String type;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "type": type == null ? null : type,
      };
}
