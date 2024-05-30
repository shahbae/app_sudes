// To parse this JSON data, do
//
//     final suratMasukModel = suratMasukModelFromJson(jsonString);

// import 'dart:convert';

// SuratMasukModel suratMasukModelFromJson(String str) =>
//     SuratMasukModel.fromJson(json.decode(str));

// String suratMasukModelToJson(SuratMasukModel data) =>
//     json.encode(data.toJson());

class SuratMasukModel {
  SuratMasukModel({
    required this.data,
  });

  List<SuratMasuk> data;

  factory SuratMasukModel.fromJson(Map<String, dynamic> json) =>
      SuratMasukModel(
        data: List<SuratMasuk>.from(
            json["data"].map((x) => SuratMasuk.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SuratMasuk {
  SuratMasuk({
    required this.id,
    required this.noAgenda,
    required this.noSurat,
    required this.jenisSurat,
    required this.kategoriSurat,
    required this.tanggalSurat,
    required this.fileSurat,
  });

  String id;
  String noAgenda;
  String noSurat;
  String jenisSurat;
  String kategoriSurat;
  DateTime tanggalSurat;
  String fileSurat;

  factory SuratMasuk.fromJson(Map<String, dynamic> json) => SuratMasuk(
        id: json["id"],
        noAgenda: json["no_agenda"],
        noSurat: json["no_surat"],
        jenisSurat: json["jenis_surat"],
        kategoriSurat: json["kategori_surat"],
        tanggalSurat: DateTime.parse(json["tanggal_surat"]),
        fileSurat: json["file_surat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no_agenda": noAgenda,
        "no_surat": noSurat,
        "jenis_surat": jenisSurat,
        "kategori_surat": kategoriSurat,
        "tanggal_surat":
            "${tanggalSurat.year.toString().padLeft(4, '0')}-${tanggalSurat.month.toString().padLeft(2, '0')}-${tanggalSurat.day.toString().padLeft(2, '0')}",
        "file_surat": fileSurat,
      };
}
