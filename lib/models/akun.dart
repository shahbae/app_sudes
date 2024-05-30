// To parse this JSON data, do
//
//     final akun = akunFromJson(jsonString);

// import 'dart:convert';

// Akun akunFromJson(String str) => Akun.fromJson(json.decode(str));

// String akunToJson(Akun data) => json.encode(data.toJson());

class Akun {
  Akun({
    required this.data,
  });

  List<Akuns> data;

  factory Akun.fromJson(Map<String, dynamic> json) => Akun(
        data: List<Akuns>.from(json["data"].map((x) => Akuns.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Akuns {
  Akuns({
    required this.id,
    required this.username,
    required this.nama,
    required this.password,
  });

  String id;
  String username;
  String nama;
  String password;

  factory Akuns.fromJson(Map<String, dynamic> json) => Akuns(
        id: json["id"],
        username: json["username"],
        nama: json["nama"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "nama": nama,
        "password": password,
      };
}
