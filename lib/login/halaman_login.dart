// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sudesapp/beranda/halaman_main.dart';
import 'package:sudesapp/models/user_model.dart';
import 'package:sudesapp/utils/login_service.dart';
import 'package:sudesapp/utils/login_interface.dart';
import 'package:sudesapp/utils/validator_helper.dart';
import 'package:sudesapp/widget/textfield.dart';

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ILogin userlogin = LoginService();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    // AuthController authController = AuthController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24.0),
                  height: 160,
                  width: 200,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                      // color: Colors.amber,
                      image: const DecorationImage(
                    image: AssetImage('assets/images/logo_dermayu.png'),
                  )),
                ),
                const Text(
                  "Surat Management Desa Jayalaksana",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // const Text(
                //   "Selamat Datang",
                //   style: TextStyle(
                //     color: Colors.blueGrey,
                //   ),
                // ),
                const SizedBox(
                  height: 24.0,
                ),
                SDTextfield(
                  kontroler: _usernameController,
                  secure: false,
                  label: "Nama Pengguna",
                  hintText: "Nama Pengguna Anda",
                  validator: (value) => Validator.required(
                    value,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SDTextfield(
                  kontroler: _passwordController,
                  secure: true,
                  label: "Kata Sandi",
                  hintText: "Kata Sandi Anda",
                  validator: (value) => Validator.required(
                    value,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      var isValid = _formkey.currentState!.validate();
                      if (isValid) {
                        UserModel user = await userlogin.login(
                            _usernameController.text, _passwordController.text);

                        print(user.token);
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return HalamanMain(
                                // username: _usernameController.text,
                                );
                          }),
                        );
                      }
                    },
                    icon: const Icon(Icons.login),
                    label: const Text(
                      "MASUK",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
