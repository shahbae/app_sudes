// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';

// class DownlowdServiceSM {
//   Future<String> download() async {
//     var externalDirectory = await getExternalStorageDirectories();
//     if (externalDirectory != null) {
//       var urlImage =
//           "http://localhost:1337/uploads/Riwayat_Surat_Keterangan_Domisili_SKD_NYURATDES_885b3773a2.pdf";
//       var dio = Dio();
//       var result = await dio.get<List<int>>(urlImage,
//           options: Options(responseType: ResponseType.bytes));
//       if (result.statusCode == 200) {
//         var byteDownloaded = result.data;
//         if (byteDownloaded != null) {
//           var file = File("${externalDirectory.path}/downloadsurat.pdf");
//           file.writeAsBytesSync(byteDownloaded);
//           return "file berhasil di save di ${dile"
//         } else {
//           return ("download error");
//         }
//       }
//     } else {
//       print("external direct null");
//       return "error";
//     }
//   }
// }
