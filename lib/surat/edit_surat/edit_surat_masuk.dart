// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sudesapp/beranda/halaman_main.dart';
import 'package:sudesapp/models/request_surat_masuk.dart';
import 'package:sudesapp/surat/list_surat/halaman_surat_masuk.dart';
import 'package:sudesapp/utils/network_modelsm.dart';
import 'package:sudesapp/utils/validator_helper.dart';
import 'package:sudesapp/widget/textfield.dart';

class HalamanEditSuratK extends StatefulWidget {
  final String? idUser;
  final String? noAgenda;
  final String? noSurat;
  final String? jenisSurat;

  final String? tanggalSurat;
  final String? fileSurat;
  final String? namaFile;

  const HalamanEditSuratK({
    Key? key,
    this.idUser,
    this.noAgenda,
    this.noSurat,
    this.jenisSurat,
    this.tanggalSurat,
    this.fileSurat,
    this.namaFile,
  }) : super(key: key);

  @override
  State<HalamanEditSuratK> createState() => _HalamanEditSuratKState();
}

class _HalamanEditSuratKState extends State<HalamanEditSuratK> {
  TextEditingController noSuratController = TextEditingController();
  TextEditingController noAgendaController = TextEditingController();
  TextEditingController jenisSuratController = TextEditingController();

  TextEditingController tanggalSuratController = TextEditingController();
  TextEditingController fileSuratController = TextEditingController();
  TextEditingController namaFileController = TextEditingController();
  String iduser = "";
  String noAgenda = "";
  String id = "";
  String noSurat = "";
  String jenisSurat = "";

  String tanggalSurat = "";
  String fileSurat = "";
  String namaFile = "";

  _HalamanEditSuratKState();
  File? pdfFile;

  var refTable = "api::surat-masuk.surat-masuk";

  int? refId;

  var fileSuratSm = "fileSurat";
  DateTime date = DateTime.now();

  @override
  void initState() {
    noAgendaController.text = widget.noAgenda!;
    noSuratController.text = widget.noSurat!;
    jenisSuratController.text = widget.jenisSurat!;

    tanggalSuratController.text = widget.tanggalSurat!;
    fileSuratController.text = widget.fileSurat.toString();
    iduser = widget.idUser.toString();
    namaFileController.text = widget.namaFile.toString();

    super.initState();
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
          'EDIT SURAT MASUK',
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                          return const HalamanSuratMasuk();
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
                height: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SDTextfield(
                    validator: (value) => Validator.required(
                      value,
                    ),
                    kontroler: noSuratController,
                    label: "No suratnya",
                    hintText: "No suratnya",
                    secure: false,
                  ),
                  SDTextfield(
                    validator: (value) => Validator.required(
                      value,
                    ),
                    kontroler: noAgendaController,
                    label: "No agendanya",
                    hintText: "No agendanya",
                    secure: false,
                  ),
                  SDTextfield(
                    validator: (value) => Validator.required(
                      value,
                    ),
                    kontroler: jenisSuratController,
                    label: "Jenis_Surat",
                    hintText: "Jenis_Surat",
                    secure: false,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SDTextfield(
                          enable: false,
                          filled: true,
                          fillColor: Colors.blue[100],
                          validator: (value) => Validator.required(
                            value,
                          ),
                          kontroler: tanggalSuratController,
                          label: "Tanggal",
                          hintText: "tanggalnya",
                          secure: false,
                        ),
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        height: 48.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              minimumSize: const Size(70, 100),
                              maximumSize: const Size(70, 100)),
                          onPressed: _showDatePicker,
                          child: const Icon(
                            Icons.calendar_month_rounded,
                          ),
                        ),
                      )
                    ],
                  ),
                  SDTextfield(
                    fillColor: Colors.blue[100],
                    filled: true,
                    enable: false,
                    validator: (value) => Validator.required(
                      value,
                    ),
                    kontroler: namaFileController,
                    label: "nama file surat",
                    hintText: "nama file surat nya",
                    secure: false,
                  ),
                ],
              ),
              Container(
                child: pdfFile != null
                    ? Column(
                        children: [
                          const Text("file akan di ganti :"),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            width: MediaQuery.of(context).size.width,
                            height: 80.0,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
                            child: Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.file_present_rounded,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      fileSuratController.text =
                                          pdfFile.toString(),
                                      maxLines: 3,
                                      textDirection: TextDirection.ltr,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        padding: const EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.file_present_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "",
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            )
                          ],
                        ),
                      ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              SizedBox(
                height: 48.0,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromARGB(248, 3, 43, 96),
                    elevation: 0,
                  ),
                  onPressed: () async {
                    selectFile();
                  },
                  icon: const Icon(Icons.upload_rounded),
                  label: const Text("Upload file surat (.pdf)"),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48.0,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(248, 3, 43, 96),
                  ),
                  onPressed: () async {
                    RequestSuratMasuk update = RequestSuratMasuk(
                      noSuratController.text,
                      noAgendaController.text,
                      jenisSuratController.text,
                      tanggalSuratController.text,
                    );

                    Map? respone = await NetworkModelSm()
                        .updateData(int.parse(iduser), update);
                    refId = respone?['data']['id'];
                    // print(refId);
                    if (pdfFile != null) {
                      uploadFiles();
                    }

                    // ignore: use_build_context_synchronously
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const HalamanMain();
                      }),
                    );
                  },
                  icon: const Icon(
                    Icons.add_circle_sharp,
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

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2500),
    ).then((value) {
      setState(() {
        date = value!;
        int year = date.year;
        int month = date.month;
        int day = date.day;
        final tgl = "$year-$month-$day";
        tanggalSuratController.text = date.toString();
      });
    });
  }

  selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      final path = result.files.single.path.toString();

      setState(() {
        pdfFile = File(path);
      });
    }
    fileSuratController.text = pdfFile.toString();
  }

  uploadFiles() async {
    final formData = FormData.fromMap({
      'files': await MultipartFile.fromFile(pdfFile!.path),
      'ref': refTable,
      'refId': refId.toString(),
      'field': fileSuratSm,
    });
    // print(formData.toString());
    var res = await Dio().post(
      'http://localhost:1337/api/upload/',
      data: formData,
    );

    print(res.toString());
  }
}
