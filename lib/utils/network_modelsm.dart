import 'package:dio/dio.dart';
import 'package:sudesapp/models/model_surat_masuk.dart';
import 'package:sudesapp/models/request_surat_masuk.dart';

class NetworkModelSm {
  late Dio _dio;

  NetworkModelSm() {
    _dio = Dio();
  }

  String url = "http://localhost:1337/api";

  Future<ModelSuratMasuk> getAll() async {
    var response = await _dio.get(
      "$url/surat-masuks/?populate[0]=fileSurat",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return ModelSuratMasuk.fromJson(response.data);
  }

  // Future<ModelSuratMasuk> getSingle(int id) async {
  //   var response = await _dio.get(
  //     "$url/surat-masuks/$id?populate[0]=fileSurat",
  //     // options: Options(
  //     //   headers: {
  //     //     "Content-Type": "application/json",
  //     //   },
  //     // ),
  //   );
  //   Map obj = response.data;
  //   return ModelSuratMasuk.fromJson(response.data);
  // }

  Future<Map?> addData(RequestSuratMasuk request) async {
    try {
      final respone = await _dio.post(
        "$url/surat-masuks",
        // options: Options(
        //   headers: {
        //     "Content-Type": "applicattion/json",
        //   },
        // ),
        data: {
          "data": request.toMap(),
        },
      );
      print(respone.data['data']['id']);
      return respone.data;
    } catch (err) {
      print(err);
    }
  }

  Future<Map?> updateData(int id, RequestSuratMasuk update) async {
    var response = await _dio.put(
      "$url/surat-masuks/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "data": update.toMap(),
      },
    );
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
      "$url/surat-masuks/$id",
    );
    print(response.statusCode);
  }
}
