import 'package:flutter/material.dart';
import 'package:sudesapp/beranda/halaman_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      title: 'SUDES',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HalamanMain(),
    );
  }
}
