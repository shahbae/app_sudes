// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class RequestSuratMasuk {
  final String no_surat;
  final String no_agenda;
  final String jenis_surat;
  final String tanggal_surat;

  RequestSuratMasuk(
    this.no_surat,
    this.no_agenda,
    this.jenis_surat,
    this.tanggal_surat,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'no_surat': no_surat,
      'no_agenda': no_agenda,
      'jenis_surat': jenis_surat,
      'tanggal_surat': tanggal_surat,
    };
  }

  factory RequestSuratMasuk.fromMap(Map<String, dynamic> map) {
    return RequestSuratMasuk(
      map['no_surat'] as String,
      map['no_agenda'] as String,
      map['jenis_surat'] as String,
      map['tanggal_surat'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestSuratMasuk.fromJson(String source) =>
      RequestSuratMasuk.fromMap(json.decode(source) as Map<String, dynamic>);
}
