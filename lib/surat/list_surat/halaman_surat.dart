import 'package:flutter/material.dart';
import 'package:sudesapp/surat/list_surat/halaman_surat_keluar.dart';
import 'package:sudesapp/surat/list_surat/halaman_surat_masuk.dart';

class HalamanSurat extends StatefulWidget {
  const HalamanSurat({super.key});

  @override
  State<HalamanSurat> createState() => _HalamanSuratState();
}

class _HalamanSuratState extends State<HalamanSurat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Data Surat",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HalamanSuratMasuk();
                        },
                      ),
                    );
                  }),
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                      gradient: RadialGradient(
                        radius: 2,
                        colors: [
                          Color.fromARGB(248, 68, 68, 156),
                          Color.fromARGB(248, 148, 148, 255)
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.move_to_inbox_rounded,
                              color: Colors.white,
                              size: 32.0,
                            ),
                            SizedBox(
                              width: 18.0,
                            ),
                            Text(
                              "Surat Masuk",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const HalamanSuratKeluar();
                      }),
                    );
                  },
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                      gradient: RadialGradient(
                        radius: 2,
                        colors: [
                          Color.fromARGB(248, 68, 68, 156),
                          Color.fromARGB(248, 148, 148, 255),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.outbox_rounded,
                              color: Colors.white,
                              size: 32.0,
                            ),
                            SizedBox(
                              width: 18.0,
                            ),
                            Text(
                              "Surat Keluar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
