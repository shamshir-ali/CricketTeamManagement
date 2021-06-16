import 'dart:convert';
import 'package:cricket_team_management/model/login_response_model.dart';
import "package:http/http.dart" as http;

import 'dart:io';

class LoginService {
  var baseURL = 'https://test-virtual-escape.encade.org/backend/';
  var tail = 'public/api/';
  Future<LoginResponseModel> login(String userName, String password ) async {
    var path = 'mobile/auth/login';
    final response = await http.post(Uri.parse(baseURL + tail + path),
        body: jsonEncode(<String, String> {'username' : userName, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    try {
      var responseData = LoginResponseModel.fromJson(jsonDecode(response.body));
      if (responseData.code == 200) {
        return responseData;
      } else {
        if (responseData.message != null && responseData.message.isEmpty) {
          throw Exception(['Unexpected exception']);
        }
      }
      return responseData;
    } catch (exception) {
      throw exception;
    }
  }
}