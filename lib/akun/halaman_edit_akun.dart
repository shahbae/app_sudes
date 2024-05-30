import 'package:flutter/material.dart';
import 'package:sudesapp/akun/halaman_akun.dart';
import 'package:sudesapp/widget/textfield.dart';

class HalamanEditAkun extends StatefulWidget {
  const HalamanEditAkun({super.key});

  @override
  State<HalamanEditAkun> createState() => _HalamanEditAkunState();
}

class _HalamanEditAkunState extends State<HalamanEditAkun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 86,
        elevation: 14.0,
        shadowColor: Colors.white60,
        title: const Text(
          'EDIT AKUN',
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
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
                          return const HalamanAkun();
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
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              const SDTextfield(
                value: "Shah Alam",
                label: "Nama anda",
                hintText: "",
                secure: false,
              ),
              const SizedBox(
                height: 0.0,
              ),
              const SDTextfield(
                value: "Shahbae",
                label: "Nama Pengguna",
                hintText: "",
                secure: false,
              ),
              const SizedBox(
                height: 0.0,
              ),
              const SDTextfield(
                value: "Shahbae",
                label: "Kata Sandi",
                hintText: "",
                secure: true,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48.0,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(248, 3, 43, 96),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                  ),
                  label: const Text(
                    "Simpan",
                    style: TextStyle(
                      fontSize: 20.0,
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
