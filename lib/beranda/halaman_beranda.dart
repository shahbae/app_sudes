import 'package:flutter/material.dart';
import 'package:sudesapp/models/model_surat_keluar.dart';
import 'package:sudesapp/models/model_surat_masuk.dart';
import 'package:sudesapp/utils/network_modelsk.dart';
import 'package:sudesapp/utils/network_modelsm.dart';

class HalamanBeranda extends StatefulWidget {
  final String? username;
  const HalamanBeranda({
    this.username,
    super.key,
  });

  @override
  State<HalamanBeranda> createState() => _HalamanBerandaState();
}

class _HalamanBerandaState extends State<HalamanBeranda> {
  List<Datum> suratmasuk = [];
  List<SuratKeluars> suratkeluar = [];
  bool isLoading = false;
  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
    });
    final resultSuratMasuk = await NetworkModelSm().getAll();
    suratmasuk = resultSuratMasuk.data;
    final resultSuratKeluar = await NetworkModelSk().getAll();
    suratkeluar = resultSuratKeluar.data;
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "Selamat datang",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // ignore: prefer_const_constructors
                // SizedBox(
                //   height: 8,
                // ),
                // Text(
                //   "widget.username.toString()",
                //   style: const TextStyle(fontSize: 20.0),
                // ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              color: Colors.blueGrey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    suratmasuk.length.toString(),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(248, 3, 43, 96),
                    ),
                  ),
                  const Text(
                    "Jumlah Surat Masuk",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              color: Colors.blueGrey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    suratkeluar.length.toString(),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(248, 3, 43, 96),
                    ),
                  ),
                  const Text(
                    "Jumlah Surat Keluar",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
