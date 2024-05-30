import 'package:dio/dio.dart';
import 'package:sudesapp/models/akun.dart';

class NetworkManagerAkuns {
  late Dio _dio;

  NetworkManagerAkuns() {
    _dio = Dio();
  }

  String url = "http://localhost:1337/api";

  Future<Akun> getAll() async {
    var response = await _dio.get(
      "$url/akuns",
      // options: Options(
      //   headers: {
      //     "Content-Type": "application/json",
      //   },
      // ),
    );
    return Akun.fromJson(response.data);
  }
}
