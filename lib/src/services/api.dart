import 'package:flutter_starter_stacked/src/constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_starter_stacked/src/ui/views/login/login_viewmodel.dart';

class API {
  static const String _apiEndpoint = kAPIEndpoint + 'auth/jwt/create';

  Future<dynamic> login() async {
    var response = await (http.post(_apiEndpoint,
        body: {'email': 'samshake7@gmail.com', 'password': 'shakir'}));
    print('Response Code:${response.statusCode}');
    print('Response Body:${response.body}');

    return response;
  }
}
