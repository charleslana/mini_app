import 'dart:convert';

import 'package:http/http.dart';
import 'package:mini_app/src/constants/text_constants.dart';
import 'package:mini_app/src/models/mini_model.dart';

class MiniService {
  MiniService(this.client);

  Client client;

  Future<MiniModel?> getMini() async {
    try {
      final response = await client.get(Uri.parse(TextConstants.baseURL));
      if (response.statusCode == 200) {
        final dynamic decodeJson = jsonDecode(response.body);
        return MiniModel.fromJson(decodeJson);
      }
      throw Exception('Error on server');
    } catch (error) {
      throw Exception(error);
    }
  }
}
