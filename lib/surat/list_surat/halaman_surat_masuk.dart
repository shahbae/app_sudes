import 'package:flutter/material.dart';
import 'package:sudesapp/models/model_surat_masuk.dart';
import 'package:sudesapp/surat/create_surat/tambah_surat_masuk.dart';
import 'package:sudesapp/surat/detail_surat/detail_surat_masuk.dart';
import 'package:sudesapp/utils/network_modelsm.dart';
import 'package:sudesapp/widget/list_surat.dart';
import 'package:sudesapp/surat/list_surat/halaman_surat.dart';

class HalamanSuratMasuk extends StatefulWidget {
  const HalamanSuratMasuk({Key? key}) : super(key: key);

  @override
  State<HalamanSuratMasuk> createState() => _HalamanSuratMasukState();
}

class _HalamanSuratMasukState extends State<HalamanSuratMasuk> {
  List<Datum> suratmasuk = [];
  bool isLoading = false;
  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
    });
    final result = await NetworkModelSm().getAll();
    suratmasuk = result.data;
    print(suratmasuk);
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
          'SURAT MASUK',
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
                          return const TambahSuratMasuk();
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
                indent: 0,
                endIndent: 0,
                color: Colors.grey,
              ),
              ListView.builder(
                reverse: true,
                itemCount: suratmasuk.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return DetailSuratMasuk(
                            id: suratmasuk[index].id.toString(),
                            noAgenda: suratmasuk[index].attributes.noAgenda,
                            noSurat: suratmasuk[index].attributes.noSurat,
                            jenisSurat: suratmasuk[index].attributes.jenisSurat,
                            tanggalSurat:
                                suratmasuk[index].attributes.tanggalSurat,
                            url: suratmasuk[index]
                                .attributes
                                .fileSurat
                                .data
                                .attributes
                                .url,
                            namaFile: suratmasuk[index]
                                .attributes
                                .fileSurat
                                .data
                                .attributes
                                .name,
                          );
                        }),
                      );
                    },
                    child: SDListSurat(
                      title: Text(
                        suratmasuk[index].attributes.jenisSurat,
                      ),
                      substitle: suratmasuk[index].attributes.noSurat,
                      tanggal: suratmasuk[index].attributes.tanggalSurat,
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
