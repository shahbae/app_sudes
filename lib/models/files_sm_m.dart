// To parse this JSON data, do
//
//     final filesSmM = filesSmMFromJson(jsonString);

import 'dart:convert';

List<FilesSmM> filesSmMFromJson(String str) =>
    List<FilesSmM>.from(json.decode(str).map((x) => FilesSmM.fromJson(x)));

String filesSmMToJson(List<FilesSmM> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FilesSmM {
  FilesSmM({
    required this.id,
    required this.name,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String hash;
  final String ext;
  final String mime;
  final double size;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory FilesSmM.fromJson(Map<String, dynamic> json) => FilesSmM(
        id: json["id"],
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"].toDouble(),
        url: json["url"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
