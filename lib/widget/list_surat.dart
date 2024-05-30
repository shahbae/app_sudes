// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SDListSurat extends StatefulWidget {
  final Widget title;
  final String substitle;
  final DateTime tanggal;
  // final Function() ontap;
  const SDListSurat({
    Key? key,
    required this.title,
    required this.substitle,
    required this.tanggal,
    // required this.ontap,
  }) : super(key: key);

  @override
  State<SDListSurat> createState() => _SDListSuratState();
}

class _SDListSuratState extends State<SDListSurat> {
  @override
  Widget build(BuildContext context) {
    final day = widget.tanggal.day;
    final month = widget.tanggal.month;
    final year = widget.tanggal.year;

    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 0.0,
        right: 0.0,
      ),
      title: widget.title,
      subtitle: Text(widget.substitle),
      leading: const Icon(
        Icons.file_present_rounded,
        size: 32.0,
        color: Color.fromARGB(248, 3, 43, 96),
      ),
      trailing: Text("$day-$month-$year"),
    );
  }
}
