import 'package:flutter/material.dart';
import 'package:sudesapp/akun/halaman_edit_akun.dart';
import 'package:sudesapp/login/halaman_login.dart';

class HalamanAkun extends StatefulWidget {
  const HalamanAkun({super.key});

  @override
  State<HalamanAkun> createState() => _HalamanAkunState();
}

class _HalamanAkunState extends State<HalamanAkun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const Text(
                    "Akun Saya",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HalamanLogin();
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.logout,
                          size: 24.0,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Log-out",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Color.fromARGB(248, 148, 148, 255),
                      Color.fromARGB(248, 68, 68, 156),
                    ],
                    radius: 0.5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(64.0),
                  ),
                ),
                child: const Icon(
                  Icons.account_circle_rounded,
                  size: 86.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              const Text(
                "username",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 28.0,
              ),
              const Text(
                "nama",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                "Nama",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 60.0,
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
                        return const HalamanEditAkun();
                      }),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                  label: const Text(
                    "Edit akun",
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
