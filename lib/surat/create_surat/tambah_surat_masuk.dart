import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sudesapp/models/request_surat_masuk.dart';
import 'package:sudesapp/surat/list_surat/halaman_surat_masuk.dart';
import 'package:sudesapp/utils/network_modelsm.dart';
import 'package:sudesapp/utils/validator_helper.dart';
import 'package:sudesapp/widget/textfield.dart';

class TambahSuratMasuk extends StatefulWidget {
  const TambahSuratMasuk({Key? key}) : super(key: key);

  @override
  State<TambahSuratMasuk> createState() => _TambahSuratMasukState();
}

class _TambahSuratMasukState extends State<TambahSuratMasuk> {
  TextEditingController noSuratController = TextEditingController();
  TextEditingController noAgendaController = TextEditingController();
  TextEditingController jenisSuratController = TextEditingController();
  TextEditingController tanggalSuratController = TextEditingController();
  TextEditingController fileSuratController = TextEditingController();

  File? pdfFile;

  var refTable = "api::surat-masuk.surat-masuk";
  int? refId;
  var fileSurat = "fileSurat";
  DateTime date = DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    String formatted = formatter.format(date);
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
          'TAMBAH SURAT MASUK',
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
                    label: "No agenda",
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
                  const SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    child: pdfFile != null
                        ? Container(
                            padding: const EdgeInsets.all(8.0),
                            width: MediaQuery.of(context).size.width,
                            height: 80.0,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
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
                                Text(
                                  fileSuratController.text = pdfFile.toString(),
                                  maxLines: 3,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
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
                                  "Belum ada data",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                  ),
                ],
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
                    RequestSuratMasuk request = RequestSuratMasuk(
                      noSuratController.text,
                      noAgendaController.text,
                      jenisSuratController.text,
                      tanggalSuratController.text,
                    );

                    final respone = await NetworkModelSm().addData(request);
                    refId = respone?['data']['id'];
                    await uploadFiles();

                    // ignore: use_build_context_synchronously
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const HalamanSuratMasuk();
                      }),
                    );
                  },
                  icon: const Icon(
                    Icons.add_circle_sharp,
                  ),
                  label: const Text(
                    "Tambah",
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
        String year = date.year.toString();
        String month = date.month.toString();
        String day = date.day.toString();
        final tgl = "$year-$month-$day";
        tanggalSuratController.text = formatter.toString();
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

      setState(
        () {
          pdfFile = File(path);
        },
      );
    }

    fileSuratController.text = pdfFile.toString();
  }

  uploadFiles() async {
    try {
      final formData = FormData.fromMap({
        'files': await MultipartFile.fromFile(pdfFile!.path),
        'ref': refTable,
        'refId': refId.toString(),
        'field': fileSurat,
      });
      // print(formData.toString());
      final res = await Dio().post(
        'http://localhost:1337/api/upload/',
        data: formData,
      );
    } catch (e) {
      print(e);
    }

    // debugPrint(res.toString());
  }
}
