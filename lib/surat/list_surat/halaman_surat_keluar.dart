import 'package:flutter/material.dart';
import 'package:sudesapp/models/model_surat_keluar.dart';
import 'package:sudesapp/surat/create_surat/tambah_surat_keluar.dart';
import 'package:sudesapp/surat/detail_surat/detail_surat_keluar.dart';
import 'package:sudesapp/utils/network_modelsk.dart';
import 'package:sudesapp/widget/list_surat.dart';
import 'package:sudesapp/surat/list_surat/halaman_surat.dart';

class HalamanSuratKeluar extends StatefulWidget {
  const HalamanSuratKeluar({Key? key}) : super(key: key);

  @override
  State<HalamanSuratKeluar> createState() => _HalamanSuratKeluarState();
}

class _HalamanSuratKeluarState extends State<HalamanSuratKeluar> {
  List<SuratKeluars> suratkeluar = [];
  bool isLoading = false;
  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
    });
    final hasil = await NetworkModelSk().getAll();
    suratkeluar = hasil.data;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 86,
        elevation: 14.0,
        shadowColor: Colors.white60,
        title: const Text(
          'SURAT KELUAR',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black87,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                          return const HalamanSurat();
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
                        color: Colors.blueGrey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const TambahSuratKeluar();
                        }),
                      );
                    },
                    icon: const Icon(
                      color: Color.fromARGB(248, 3, 43, 96),
                      Icons.add,
                    ),
                    label: const Text(
                      "Tambah surat",
                      style: TextStyle(
                        color: Color.fromARGB(248, 3, 43, 96),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 24,
                thickness: 0,
                endIndent: 0,
                color: Colors.grey,
              ),
              ListView.builder(
                reverse: true,
                itemCount: suratkeluar.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return DetailSuratKeluar(
                            id: suratkeluar[index].id.toString(),
                            noAgenda: suratkeluar[index].attributes.noAgenda,
                            noSurat: suratkeluar[index].attributes.noSurat,
                            jenisSurat:
                                suratkeluar[index].attributes.jenisSurat,
                            tanggalSurat:
                                suratkeluar[index].attributes.tanggalSurat,
                            namaFile: suratkeluar[index]
                                .attributes
                                .fileSurat
                                .data
                                .attributes
                                .name,
                            urlFile: suratkeluar[index]
                                .attributes
                                .fileSurat
                                .data
                                .attributes
                                .url,
                          );
                        }),
                      );
                    },
                    child: SDListSurat(
                      title: Text(
                        suratkeluar[index].attributes.jenisSurat,
                      ),
                      substitle: suratkeluar[index].attributes.noSurat,
                      tanggal: suratkeluar[index].attributes.tanggalSurat,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
