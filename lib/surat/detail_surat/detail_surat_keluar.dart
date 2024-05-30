// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:sudesapp/beranda/halaman_main.dart';
import 'package:sudesapp/surat/edit_surat/edit_surat_keluar.dart';
import 'package:sudesapp/surat/list_surat/halaman_surat_masuk.dart';
import 'package:sudesapp/utils/network_modelsk.dart';
import 'package:sudesapp/widget/list_detail.dart';

class DetailSuratKeluar extends StatefulWidget {
  final String noAgenda;
  final String id;
  final String noSurat;
  final String jenisSurat;
  final DateTime tanggalSurat;
  final String? namaFile;
  final String? urlFile;

  const DetailSuratKeluar({
    Key? key,
    required this.noAgenda,
    required this.id,
    required this.noSurat,
    required this.jenisSurat,
    required this.tanggalSurat,
    this.namaFile,
    this.urlFile,
  }) : super(key: key);

  @override
  State<DetailSuratKeluar> createState() => _DetailSuratKeluarState();
}

class _DetailSuratKeluarState extends State<DetailSuratKeluar> {
  String noAgenda = "";
  String id = "";
  String noSurat = "";
  String jenisSurat = "";
  String tanggalSurat = "";
  String urlFile = "";
  String namaFile = "";

  @override
  void initState() {
    noAgenda = widget.noAgenda;
    noSurat = widget.noSurat;
    jenisSurat = widget.jenisSurat;
    tanggalSurat = widget.tanggalSurat.toString();

    namaFile = widget.namaFile.toString();
    urlFile = "http://localhost:1337" + widget.urlFile.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final day = widget.tanggalSurat.day;
    final month = widget.tanggalSurat.month;
    final year = widget.tanggalSurat.year;
    final tgl = ("$year-$month-$day");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 86,
        elevation: 14.0,
        shadowColor: Colors.white60,
        title: const Text(
          'DETAIL SURAT',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black87,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.all(0.0),
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const HalamanSuratMasuk();
                        }),
                      );
                    },
                    icon: const Icon(
                      color: Colors.blueGrey,
                      Icons.chevron_left_outlined,
                    ),
                    label: const Text(
                      "kembali",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.all(0.0),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: const Text(
                                "Hapus",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.0,
                                ),
                              ),
                              content: const Text(
                                "Jika di hapus, data surat ini akan hilang selamanya, dan tidak akan muncul di hidup anda lagi.",
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Batal",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () {
                                    NetworkModelSk()
                                        .deleteUpdate(int.parse(widget.id));
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return const HalamanMain();
                                      }),
                                    );
                                  },
                                  child: const Text(
                                    "ya",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }));
                    },
                    icon: const Icon(
                      color: Colors.red,
                      Icons.delete,
                    ),
                    label: const Text(
                      "Hapus",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 360,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Color.fromARGB(248, 3, 43, 96),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const CircleAvatar(
                            // ignore: sort_child_properties_last
                            child: Icon(
                              Icons.file_present_rounded,
                              color: Colors.white,
                            ),
                            backgroundColor: Color.fromARGB(83, 158, 158, 158),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Flexible(
                            child: Text(
                              widget.jenisSurat,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      ListDetail(
                        atribut: "No surat",
                        valueAtribut: widget.noSurat,
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      ListDetail(
                        atribut: "No Agenda",
                        valueAtribut: widget.noAgenda,
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      ListDetail(
                        atribut: "Tanggal Surat",
                        valueAtribut: "$tgl",
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ListDetail(
                        atribut: "File surat",
                        // ignore: unnecessary_string_interpolations
                        valueAtribut: widget.namaFile,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48.0,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(248, 3, 43, 96),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return HalamanEditSuratK(
                          idUser: widget.id,
                          noAgenda: noAgenda,
                          noSurat: noSurat,
                          jenisSurat: jenisSurat,
                          tanggalSurat: tanggalSurat,
                          namaFile: namaFile,
                        );
                      }),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                  label: const Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48.0,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  onPressed: () {
                    print(urlFile);
                  },
                  icon: const Icon(
                    Icons.download,
                    color: Color.fromARGB(248, 3, 43, 96),
                  ),
                  label: const Text(
                    "Download",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(248, 3, 43, 96),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
