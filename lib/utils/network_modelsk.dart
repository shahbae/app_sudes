import 'package:dio/dio.dart';
import 'package:sudesapp/models/model_surat_keluar.dart';
import 'package:sudesapp/models/request_surat_keluar.dart';

class NetworkModelSk {
  late Dio _dio;

  NetworkModelSk() {
    _dio = Dio();
  }

  String url = "http://localhost:1337/api";

  Future<ModelSuratKeluar> getAll() async {
    var response = await _dio.get(
      "$url/surat-keluars/?populate[0]=fileSurat",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return ModelSuratKeluar.fromJson(response.data);
  }

  // Future<ModelSuratKeluar> getSingle(int id) async {
  //   var response = await _dio.get(
  //     "$url/surat-keluars/$id?populate[0]=fileSurat",
  //     // options: Options(
  //     // headers: {
  //     // "Content-Type": "application/json",
  //     // },
  //     // ),
  //   );
  //   Map obj = response.data;
  //   return ModelSuratKeluar.fromJson(response.data);
  // }

  Future<Map?> addData(RequestSuratKeluar request) async {
    var response = await _dio.post(
      "$url/surat-keluars",
      data: {
        "data": request.toMap(),
      },
    );
    print(response.data['data']['id']);
    return response.data;
  }

  Future<Map?> updateData(int id, RequestSuratKeluar update) async {
    var response = await _dio.put(
      "$url/surat-keluars/$id",
      // options: Options(
      //   headers: {
      //     "Content-Type": "application/json",
      //   },
      // ),
      data: {
        "data": update.toMap(),
      },
    );
    print(response.data);
    print(response.data['data']['id']);
    return response.data;
  }

  Future<void> deleteUpdate(int id) async {
    var response = await _dio.delete(
      // options: Options(
      //   headers: {
      //     "Content-Type": "application/json",
      //   },
      // ),
      "$url/surat-keluars/$id",
    );
    print(response.statusCode);
  }
}
