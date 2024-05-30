// To parse this JSON data, do
//
//     final modelSuratMasuk = modelSuratMasukFromJson(jsonString);

import 'dart:convert';

ModelSuratMasuk modelSuratMasukFromJson(String str) =>
    ModelSuratMasuk.fromJson(json.decode(str));

String modelSuratMasukToJson(ModelSuratMasuk data) =>
    json.encode(data.toJson());

class ModelSuratMasuk {
  ModelSuratMasuk({
    required this.data,
    required this.meta,
  });

  final List<Datum> data;
  final Meta meta;

  factory ModelSuratMasuk.fromJson(Map<String, dynamic> json) =>
      ModelSuratMasuk(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.attributes,
  });

  final int id;
  final DatumAttributes attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: DatumAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class DatumAttributes {
  DatumAttributes({
    required this.noSurat,
    required this.noAgenda,
    required this.jenisSurat,
    required this.tanggalSurat,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.fileSurat,
  });

  final String noSurat;
  final String noAgenda;
  final String jenisSurat;
  final DateTime tanggalSurat;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final FileSurat fileSurat;

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        noSurat: json["no_surat"],
        noAgenda: json["no_agenda"],
        jenisSurat: json["jenis_surat"],
        tanggalSurat: DateTime.parse(json["tanggal_surat"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        fileSurat: FileSurat.fromJson(json["fileSurat"]),
      );

  Map<String, dynamic> toJson() => {
        "no_surat": noSurat,
        "no_agenda": noAgenda,
        "jenis_surat": jenisSurat,
        "tanggal_surat":
            "${tanggalSurat.year.toString().padLeft(4, '0')}-${tanggalSurat.month.toString().padLeft(2, '0')}-${tanggalSurat.day.toString().padLeft(2, '0')}",
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "fileSurat": fileSurat.toJson(),
      };
}

class FileSurat {
  FileSurat({
    required this.data,
  });

  final Data data;

  factory FileSurat.fromJson(Map<String, dynamic> json) => FileSurat(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.attributes,
  });

  final int id;
  final DataAttributes attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: DataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class DataAttributes {
  DataAttributes({
    required this.name,
    required this.alternativeText,
    required this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    required this.previewUrl,
    required this.provider,
    required this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  final String name;
  final dynamic alternativeText;
  final dynamic caption;
  final dynamic width;
  final dynamic height;
  final dynamic formats;
  final String hash;
  final String ext;
  final String mime;
  final double size;
  final String url;
  final dynamic previewUrl;
  final String provider;
  final dynamic providerMetadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: json["formats"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"].toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Meta {
  Meta({
    required this.pagination,
  });

  final Pagination pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
