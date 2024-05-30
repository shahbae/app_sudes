import 'package:flutter/material.dart';
import 'package:sudesapp/beranda/halaman_beranda.dart';
import 'package:sudesapp/login/halaman_login.dart';
import 'package:sudesapp/surat/list_surat/halaman_surat.dart';

class HalamanMain extends StatefulWidget {
  final String? username;
  const HalamanMain({
    this.username,
    super.key,
  });

  @override
  State<HalamanMain> createState() => _HalamanMainState();
}

class _HalamanMainState extends State<HalamanMain> {
  int _pilihanbuttom = 0;

  final List<Widget> _children = [
    const HalamanBeranda(),
    const HalamanSurat(),
    // const HalamanAkun(),
  ];

  void _onItemtapped(int index) {
    setState(() {
      _pilihanbuttom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      "Keluar",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      ),
                    ),
                    content: const Text(
                      "Apakah yakin anda keluar ?",
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
                          Navigator.push(
                            context,
                            
                            MaterialPageRoute(
                              builder: (context) {
                                return const HalamanLogin();
                              },
                            ),
                          );
                        },
                        child: const Text("Keluar"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.logout_rounded,
            ),
            color: Colors.red,
          )
        ],
        automaticallyImplyLeading: false,
        toolbarHeight: 86,
        elevation: 14.0,
        shadowColor: Colors.white60,
        title: const Text(
          'SURAT DESA',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black87,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: _children[_pilihanbuttom],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(248, 3, 43, 96),
        selectedFontSize: 18,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: 'Surat',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.account_circle),
          //   label: 'Akun',
          // ),
        ],
        currentIndex: _pilihanbuttom,
        onTap: _onItemtapped,
      ),
    );
  }
}
