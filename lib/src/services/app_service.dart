import 'dart:convert';

import 'package:http/http.dart';
import 'package:mini_app/src/constants/config_constants.dart';
import 'package:mini_app/src/models/app_model.dart';

class AppService {
  AppService(this.client);

  Client client;

  Future<AppModel?> getApp() async {
    try {
      final Response response =
          await client.get(Uri.parse(ConfigConstants.baseURL));
      if (response.statusCode == 200) {
        final dynamic decodeJson = jsonDecode(response.body);
        return AppModel.fromJson(decodeJson);
      }
      throw Exception('Error on server');
    } catch (error) {
      throw Exception(error);
    }
  }
}
