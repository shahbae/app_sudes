import 'package:dio/dio.dart';

import 'package:sudesapp/models/user_model.dart';
import 'package:sudesapp/utils/login_interface.dart';

class LoginService extends ILogin {
  @override
  Future<UserModel> login(String username, String password) async {
    const api = 'http://localhost:1337/api/auth/local';
    final data = {"identifier": username, "password": password};

    final dio = Dio();
    Response response;

    response = await dio.post(api, data: data);
    final body = response.data;
    return UserModel(username: username, token: body['token']);
    // if (response.statusCode == 200) {
    //   final body = response.data;
    //   return UserModel(username: username, token: body['token']);
    // } else {
    //   return null;
    // }
  }
}
