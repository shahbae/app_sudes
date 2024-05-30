import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:sudesapp/login/halaman_login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_dermayu.png',
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Surat Management Desa Jayalaksana',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(248, 68, 68, 156),
          nextScreen: const HalamanLogin(),
          splashIconSize: 250,
          duration: 2500,
          splashTransition: SplashTransition.fadeTransition,
        ));
  }
}
